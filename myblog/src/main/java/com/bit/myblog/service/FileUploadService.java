package com.bit.myblog.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bit.myblog.vo.BlogVo;
import com.bit.myblog.vo.PostVo;

import net.coobird.thumbnailator.Thumbnails;

@Service
public class FileUploadService {
	
	private static final int THUMB_WIDTH = 300;
	private static final int THUMB_HEIGHT = 169;

	public String uploadLogo(MultipartFile file, String uploadPath) {
		
		UUID uid = UUID.randomUUID();
		
		String fileName = file.getOriginalFilename();
		fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
		
		String saveOriginName = uid + "_" + fileName;
		
		String saveThumbName = uid + "_thumb_" + fileName;
		
		String originPath = uploadPath + "\\" + saveOriginName;
		String thumbPath = uploadPath + "\\" + saveThumbName;
		
		try {
			
			File origin = new File(originPath);
			file.transferTo(origin);
			
			File thumbNail = new File(thumbPath);
			
			if(origin.exists()) {
//				image.getParentFile().mkdirs();
				Thumbnails.of(origin).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbNail);
			}
			file.transferTo(thumbNail);
		} catch (IllegalStateException e) {
			System.out.println("IllegalStateException : " +e.getMessage());
		} catch (IOException e) {
			System.out.println("IOException : " + e.getMessage());
		}	
		
		
		return saveOriginName + "," + saveThumbName;
	}

	public boolean blogDelete(BlogVo blogVo, String uploadPath) {
		String originPath = uploadPath + "\\" + blogVo.getO_logo();
		String thumbPath = uploadPath + "\\" + blogVo.getT_logo();
		
		File origin = new File(originPath);
		File thumbNail = new File(thumbPath);
		
		return origin.delete() && thumbNail.delete();
	}

	public String uploadFile(MultipartFile file, String uploadPath) {
		UUID uid = UUID.randomUUID();
		
		String fileName = file.getOriginalFilename();
		fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
		
		String saveName = uid + "_" + fileName;
		
		String savePath = uploadPath + "\\" + saveName;
		
		try {
			File saveFile = new File(savePath);
			file.transferTo(saveFile);
		} catch (IllegalStateException e) {
			System.out.println("IllegalStateException : " + e.getMessage());
		} catch (IOException e) {
			System.out.println("IOException : " + e.getMessage());
		}
		
		return saveName;
	}

	public boolean postDelete(PostVo postVo, String uploadPath) {
		String path = uploadPath + "\\" + postVo.getAttach_file();
		
		File file = new File(path);
		return file.delete();
	}

}
