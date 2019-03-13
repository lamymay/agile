package com.arc.agile.controller.data.test;

import javax.servlet.ReadListener;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 *
 * @author 叶超
 * @since 2019/3/12 9:20
 */
//新建个类 用来存放body
public class MAPIHttpServletRequestWrapper extends HttpServletRequestWrapper {

    private final byte[] body; // 报文

    public MAPIHttpServletRequestWrapper(HttpServletRequest request) throws IOException {
        super(request);
        body = StreamUtil.readBytesFromInputStream(request.getInputStream());
    }

    @Override
    public BufferedReader getReader() throws IOException {
        return new BufferedReader(new InputStreamReader(getInputStream()));
    }

    @Override
    public ServletInputStream getInputStream() throws IOException {
        final ByteArrayInputStream bais = new ByteArrayInputStream(body);
        return new ServletInputStream() {

            @Override
            public boolean isFinished() {
                return false;
            }

            @Override
            public boolean isReady() {
                return false;
            }

            @Override
            public void setReadListener(ReadListener readListener) {

            }

            @Override
            public int read() throws IOException {
                return bais.read();
            }
        };
    }

}

//解决 request.getInputStream() 只能获取一次body的问题
//问题：
//　　在使用HTTP协议实现应用间接口通信时，服务端读取客户端请求过来的数据，会用到request.getInputStream()，第一次读取的时候可以读取到数据，但是接下来的读取操作都读取不到数据
//
//原因：
//　　1. 一个InputStream对象在被读取完成后，将无法被再次读取，始终返回-1；
//　　2. InputStream并没有实现reset方法（可以重置首次读取的位置），无法实现重置操作；
//解决方法（缓存读取到的数据）：
//1.使用request、session等来缓存读取到的数据,这种方式很容易实现，只要setAttribute和getAttribute就行；
//2.使用HttpServletRequestWrapper来包装HttpServletRequest，在MAPIHttpServletRequestWrapper中初始化读取request的InputStream数据，以byte[]形式缓存在其中，然后在Filter中将request转换为包装过的request；代码如下：
