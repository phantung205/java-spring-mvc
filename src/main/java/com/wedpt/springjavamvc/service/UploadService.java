package com.wedpt.springjavamvc.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class UploadService {
    private final ServletContext servletContext;

    public UploadService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public String handleSaveUploadFile(MultipartFile file, String targitFolder) {
        // don't upload file
        if (file.isEmpty()) {
            return "";
        }
        String rootPath = this.servletContext.getRealPath("/resources/images");
        String fineName = "";
        try {
            byte[] bytes = file.getBytes();

            File dir = new File(rootPath + File.separator + targitFolder);
            if (!dir.exists())
                dir.mkdirs();
            // Create the file on server
            fineName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
            File serverFile = new File(dir.getAbsolutePath() + File.separator +
                    fineName);
            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
        } catch (Exception e) {
            // TODO: handle exception
        }
        return fineName;
    }
}
