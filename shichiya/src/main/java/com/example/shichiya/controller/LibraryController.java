package com.example.shichiya.controller;

import com.example.shichiya.pojo.Book;
import com.example.shichiya.service.BookService;
import com.example.shichiya.utils.StringUtils;
import com.example.shichiya.pojo.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@RestController
public class LibraryController {
    @Autowired
    BookService bookService;

    @CrossOrigin
    @GetMapping("/api/books")
    public List<Book> list() throws Exception {
        return bookService.list();
    }

    @CrossOrigin
    @PostMapping("/api/books")
    public Book addOrUpdate(@RequestBody Book book) throws Exception {
        bookService.addOrUpdate(book);
        return book;
    }

    @CrossOrigin
    @PostMapping("/api/delete")
    public void delete(@RequestBody Book book) throws Exception {
        bookService.deleteById(book.getId());
    }

    @CrossOrigin
    @GetMapping("/api/search")
    public List<Book> searchResult(@RequestBody Search s) throws Exception {
        if ("".equals(s.getKeywords())) {
            return bookService.list();
        } else {
            return bookService.Search(s.getKeywords());
        }
    }

    @CrossOrigin
    @GetMapping("/api/categories/{cid}/books")
    public List<Book> listByCategory(@PathVariable("cid") int cid) throws Exception {
        if (0 != cid) {
            return bookService.listByCategory(cid);
        } else {
            return list();
        }
    }

    @CrossOrigin
    @PostMapping("api/covers")
    public String coversUpload(MultipartFile file) throws Exception {
        String folder = "F:/workspace/img";
        File imageFolder = new File(folder);
        File f = new File(imageFolder, StringUtils.getRandomString(6) + file.getOriginalFilename()
                .substring(file.getOriginalFilename().length() - 4));
        if (!f.getParentFile().exists())
            f.getParentFile().mkdirs();
        try {
            file.transferTo(f);
            String imgURL = "http://localhost:8443/api/img/" + f.getName();
            return imgURL;
        } catch (IOException e) {
            e.printStackTrace();
            return "";
        }
    }

    @CrossOrigin
    @PostMapping("api/file")
    public String fileUpload(MultipartFile file) throws Exception {
        String folder = "F:/workspace/file";
        File fileFolder = new File(folder);
        File f = new File(fileFolder, StringUtils.getRandomString(6) + file.getOriginalFilename()
                .substring(file.getOriginalFilename().length() - 4));
        if (!f.getParentFile().exists())
            f.getParentFile().mkdirs();
        try {
            file.transferTo(f);
            String fileURL = "http://localhost:8443/api/file/" + f.getName();
            return  fileURL;
        } catch (IOException e) {
            e.printStackTrace();
            return "";
        }
    }
}