package com.bit.myblog.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bit.myblog.vo.BlogVo;
import com.bit.myblog.vo.PostVo;

import net.coobird.thumbnailator.Thumbnails;

@Service
public class FileUploadService {
	
	private static final int THUMB_WIDTH = 250;
	private static final int THUMB_HEIGHT = 150;

	public String uploadLogo(MultipartFile file, String uploadPath) {
		
		UUID uid = UUID.randomUUID();
		
		String fileName = file.getOriginalFilename();
		
		String saveOriginName = uid + "_" + fileName;
		
		String saveThumbName = uid + "_thumb_" + fileName;
		
		String originPath = uploadPath + "\\" + saveOriginName;
		String thumbPath = uploadPath + "\\" + saveThumbName;
		
		try {
			
			File origin = new File(originPath);
			file.transferTo(origin);
			
			File thumbNail = new File(thumbPath);
			file.transferTo(thumbNail);
			if(origin.exists()) {
				Thumbnails.of(origin).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbNail);
			}
			
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

	public List<String> uploadFile(MultipartFile file, String uploadPath) {
		
		List<String> list = new ArrayList<>();
		UUID uid = UUID.randomUUID();
		
		String ext = FilenameUtils.getExtension(file.getOriginalFilename());
		
		String originName = file.getOriginalFilename();
		String storedName = uid + "." + ext;
		
		String savePath = uploadPath + "\\" + storedName;
		
		
		try {
			File saveFile = new File(savePath);
			file.transferTo(saveFile);
		} catch (IllegalStateException e) {
			System.out.println("IllegalStateException : " + e.getMessage());
		} catch (IOException e) {
			System.out.println("IOException : " + e.getMessage());
		}
		
		list.add(originName);
		list.add(storedName);
		
		return list;
	}

	public boolean postDelete(PostVo postVo, String uploadPath) {
		String path = uploadPath + "\\" + postVo.getStored_file();
		
		File file = new File(path);
		return file.delete();
	}

}
