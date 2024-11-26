package com.example.controller;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.entity.*;
import com.example.service.RoomService;

@Controller
public class roomController {
	public  String generateRandomString(int length) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuilder sb = new StringBuilder(length);

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length());
            sb.append(characters.charAt(index));
        }

        return sb.toString();
    } 
	@Autowired
	RoomService roomService;
	
	@ResponseBody
	@GetMapping("/addRoom")
	public List<Room> addRoom(){
		roomService.addRoom(new Room(this.generateRandomString(4),this.generateRandomString(8), 50));
		return roomService.listRooms;
	}
	
	@ResponseBody
	@GetMapping("/deleteRoom/{id}")
	public List<Room> deleteRoom(@PathVariable("id") String id){
		roomService.deleteRoom(id);
		return roomService.listRooms;
	}
}
