package com.arc.agile.controller.data.test;

import java.io.*;

/**
 * @author 叶超
 * @since 2019/3/12 11:00
 */
public class StreamUtil {

    /**
     * @param inputStream ServletInputStream
     * @return
     */
    public static byte[] readBytesFromInputStream(InputStream inputStream) {
        try {
            return getContentStrFromInputStream(inputStream).getBytes();
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 从输入流读取数据
     *
     * @param in
     * @return
     * @throws IOException
     */
    public static String getContentStrFromInputStream(InputStream in) throws IOException {
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        byte[] buf = new byte[1024];
        int iCnt = 0;

        while ((iCnt = in.read(buf)) > 0) {
            os.write(buf, 0, iCnt);
        }
        in.close();
        return os.toString("UTF-8");
    }


    /**
     * 从输入流读取指定长度的数据
     *
     * @param in
     * @param length
     * @return
     * @throws IOException
     */
    public static byte[] getContentFromInputStream(InputStream in, int length) throws IOException {
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        byte[] buf = new byte[1024];

        while (os.size() < length) {
            int n = in.read(buf);
            if (n > 0) {
                os.write(buf, 0, n);
            } else if (n < 0) {
                break;
            }
        }
        in.close();
        return os.toByteArray();
    }


    // 从文件读取数据
    public static byte[] getContentFromFile(String filePath) throws IOException {
        FileInputStream fin = new FileInputStream(filePath);
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        int n = -1;
        byte[] buf = new byte[1024];
        while ((n = fin.read(buf)) != -1) {
            os.write(buf, 0, n);
        }
        fin.close();
        return os.toByteArray();
    }

    // 写数据到文件
    public static void writeContentToFile(String filePath, byte[] content) throws IOException {
        FileOutputStream fout = new FileOutputStream(filePath, false);

        fout.write(content);

        fout.close();

    }

    /**
     * 将输入流的内容全部输出到输出流
     *
     * @param is
     * @param os
     * @throws IOException
     */
    public static void copy(InputStream is, OutputStream os) throws IOException {
        synchronized (is) {
            synchronized (os) {
                byte[] buffer = new byte[256];
                while (true) {
                    int bytesRead = is.read(buffer);
                    if (bytesRead == -1) {
                        break;
                    }
                    os.write(buffer, 0, bytesRead);
                }
            }
        }
    }


}
