package com.roo.utils;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.Vector;

import org.apache.commons.io.IOUtils;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

/**
 * 
 * @ClassName: SFTPUtil
 * @Description: sftp���ӹ�����
 * @date 2017��5��22�� ����11:17:21
 * @version 1.0.0
 */
public class SFTPUtil {
//	private transient Logger log = LoggerFactory.getLogger(this.getClass());
    
    private ChannelSftp sftp;
      
    private Session session;
    /** FTP ��¼�û���*/  
    private String username;
    /** FTP ��¼����*/  
    private String password;
    /** ˽Կ */  
    private String privateKey;
    /** FTP ��������ַIP��ַ*/  
    private String host;
    /** FTP �˿�*/
    private int port;
      
  
    /** 
     * �������������֤��sftp���� 
     * @param userName 
     * @param password 
     * @param host 
     * @param port 
     */  
    public SFTPUtil(String username, String password, String host, int port) {
        this.username = username;
        this.password = password;
        this.host = host;
        this.port = port;
    }
  
    /** 
     * ���������Կ��֤��sftp����
     * @param userName
     * @param host
     * @param port
     * @param privateKey
     */
    public SFTPUtil(String username, String host, int port, String privateKey) {
        this.username = username;
        this.host = host;
        this.port = port;
        this.privateKey = privateKey;
    }
  
    public SFTPUtil(){}
  
    /**
     * ����sftp������
     *
     * @throws Exception 
     */
    public void login(){
        try {
            JSch jsch = new JSch();
            if (privateKey != null) {
                jsch.addIdentity(privateKey);// ����˽Կ
//                log.info("sftp connect,path of private key file��{}" , privateKey);
            }
//            log.info("sftp connect by host:{} username:{}",host,username);
  
            session = jsch.getSession(username, host, port);
//            log.info("Session is build");
            if (password != null) {
                session.setPassword(password);  
            }
            Properties config = new Properties();
            config.put("StrictHostKeyChecking", "no");
              
            session.setConfig(config);
            session.connect();
//            log.info("Session is connected");
            
            Channel channel = session.openChannel("sftp");
            channel.connect();
//            log.info("channel is connected");
  
            sftp = (ChannelSftp) channel;
//            log.info(String.format("sftp server host:[%s] port:[%s] is connect successfull", host, port));
        } catch (Exception e) {
//            log.error("Cannot connect to specified sftp server : {}:{} \n Exception message is: {}", new Object[]{host, port, e.getMessage()});  
        }
    }  
  
    /**
     * �ر����� server 
     */
    public void logout(){
        if (sftp != null) {
            if (sftp.isConnected()) {
                sftp.disconnect();
//                log.info("sftp is closed already");
            }
        }
        if (session != null) {
            if (session.isConnected()) {
                session.disconnect();
//                log.info("sshSession is closed already");
            }
        }
    }
  
    /** 
     * ���������������ϴ���sftp��Ϊ�ļ� 
     *  
     * @param directory 
     *            �ϴ�����Ŀ¼ 
     * @param sftpFileName 
     *            sftp���ļ��� 
     * @param in 
     *            ������ 
     * @throws SftpException  
     * @throws Exception 
     */  
    public void upload(String directory, String sftpFileName, InputStream input) throws Exception{
        try {  
            sftp.cd(directory);
        } catch (Exception e) {
//            log.warn("directory is not exist");
            sftp.mkdir(directory);
            sftp.cd(directory);
        }
        sftp.put(input, sftpFileName);
//        log.info("file:{} is upload successful" , sftpFileName);
    }
  
    /** 
     * �ϴ������ļ�
     *
     * @param directory 
     *            �ϴ���sftpĿ¼ 
     * @param uploadFile
     *            Ҫ�ϴ����ļ�,����·�� 
     * @throws FileNotFoundException
     * @throws SftpException
     * @throws Exception
     */
    public void upload(String directory, String uploadFile) throws FileNotFoundException, Exception{
        File file = new File(uploadFile);
        upload(directory, file.getName(), new FileInputStream(file));
    }
  
    /**
     * ��byte[]�ϴ���sftp����Ϊ�ļ���ע��:��String����byte[]�ǣ�Ҫָ���ַ�����
     * 
     * @param directory
     *            �ϴ���sftpĿ¼
     * @param sftpFileName
     *            �ļ���sftp�˵�����
     * @param byteArr
     *            Ҫ�ϴ����ֽ�����
     * @throws SftpException
     * @throws Exception
     */
    public void upload(String directory, String sftpFileName, byte[] byteArr) throws Exception{
        upload(directory, sftpFileName, new ByteArrayInputStream(byteArr));
    }
  
    /** 
     * ���ַ�������ָ�����ַ������ϴ���sftp
     *  
     * @param directory
     *            �ϴ���sftpĿ¼
     * @param sftpFileName
     *            �ļ���sftp�˵�����
     * @param dataStr
     *            ���ϴ�������
     * @param charsetName
     *            sftp�ϵ��ļ��������ַ����뱣��
     * @throws UnsupportedEncodingException
     * @throws SftpException
     * @throws Exception
     */
    public void upload(String directory, String sftpFileName, String dataStr, String charsetName) throws UnsupportedEncodingException, Exception{  
        upload(directory, sftpFileName, new ByteArrayInputStream(dataStr.getBytes(charsetName)));  
    }
  
    /**
     * �����ļ� 
     *
     * @param directory
     *            ����Ŀ¼ 
     * @param downloadFile
     *            ���ص��ļ�
     * @param saveFile
     *            ���ڱ��ص�·��
     * @throws SftpException
     * @throws FileNotFoundException
     * @throws Exception
     */  
    public void download(String directory, String downloadFile, String saveFile) throws Exception, FileNotFoundException{
        if (directory != null && !"".equals(directory)) {
            sftp.cd(directory);
        }
        File file = new File(saveFile);
        sftp.get(downloadFile, new FileOutputStream(file));
//        log.info("file:{} is download successful" , downloadFile);
    }
    /** 
     * �����ļ�
     * @param directory ����Ŀ¼
     * @param downloadFile ���ص��ļ���
     * @return �ֽ�����
     * @throws SftpException
     * @throws IOException
     * @throws Exception
     */
    public byte[] download(String directory, String downloadFile) throws Exception, IOException{
        if (directory != null && !"".equals(directory)) {
            sftp.cd(directory);
        }
        InputStream is = sftp.get(downloadFile);
        
        byte[] fileData = IOUtils.toByteArray(is);
        
//        log.info("file:{} is download successful" , downloadFile);
        return fileData;
    }
  
    /**
     * ɾ���ļ�
     *  
     * @param directory
     *            Ҫɾ���ļ�����Ŀ¼
     * @param deleteFile
     *            Ҫɾ�����ļ�
     * @throws SftpException
     * @throws Exception
     */
    public void delete(String directory, String deleteFile) throws Exception{
        sftp.cd(directory);
        sftp.rm(deleteFile);
    }
  
    /**
     * �г�Ŀ¼�µ��ļ�
     * 
     * @param directory
     *            Ҫ�г���Ŀ¼
     * @param sftp
     * @return
     * @throws SftpException
     */
    public Vector<?> listFiles(String directory) throws Exception {
        return sftp.ls(directory);
    }
    
    public static void main(String[] args) throws Exception, IOException {
        /*SFTPUtil sftp = new SFTPUtil("rhkf", "rhkf", "218.202.142.35", 22);
        sftp.login();
        sftp.upload("ngroute_nmFtpTest", "F:\\imooc\\java_io\\1.txt");
        sftp.logout();*/
    	
    	SFTPUtil sftp = new SFTPUtil("root", "ys123456", "192.168.19.129", 22);
        sftp.login();
        sftp.upload("roo-share/test", "C:\\Users\\yangsheng\\Desktop\\t01d1f1a2ae31e3c3e4.png");
        sftp.logout();
    	
    }
}
