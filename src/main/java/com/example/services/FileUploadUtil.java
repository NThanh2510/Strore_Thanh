package com.example.services;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

public class FileUploadUtil {
    public static void saveFile(String uploadDir, String fileName, MultipartFile file) throws IOException {
        File uploadDirFile = new File(uploadDir);
        if (!uploadDirFile.exists()) {
            uploadDirFile.mkdirs(); // Tạo thư mục nếu chưa tồn tại
        }
        Path filePath = Paths.get(uploadDir + fileName);
        file.transferTo(filePath); // Chuyển file vào đường dẫn đã chỉ định
    }
}
