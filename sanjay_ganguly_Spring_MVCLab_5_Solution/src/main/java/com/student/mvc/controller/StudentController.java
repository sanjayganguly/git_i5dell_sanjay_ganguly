package com.student.mvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.student.mvc.model.Student;
import com.student.mvc.service.StudentService;
 
@Controller
@RequestMapping("/")
public class StudentController {
 
    private static final Logger logger = Logger
            .getLogger(StudentController.class);
 
 
    @Autowired
    private StudentService studentService;
 
    @RequestMapping(value = "/listStudents")
    public ModelAndView listStudents(ModelAndView model) throws IOException {
        List<Student> listStudents = studentService.getAllStudents();
        model.addObject("students", listStudents);
        model.setViewName("home");
        return model;
    }
 
    @RequestMapping(value = "/newStudent", method = RequestMethod.GET)
    public ModelAndView newStudent(ModelAndView model) {
        Student student = new Student();
        model.addObject("student", student);
        model.setViewName("StudentForm");
        return model;
    }
 
    @RequestMapping(value = "/saveStudent", method = RequestMethod.POST)
    public ModelAndView saveStudent(@ModelAttribute Student student) {
        if (student.getId() == 0) { 
            studentService.addStudent(student);
        } else {
            studentService.updateStudent(student);
        }
        return new ModelAndView("redirect:/listStudents");
    }
 
    @RequestMapping(value = "/deleteStudent", method = RequestMethod.GET)
    public ModelAndView deleteStudent(HttpServletRequest request) {
        int studentId = Integer.parseInt(request.getParameter("id"));
        studentService.deleteStudent(studentId);
        return new ModelAndView("redirect:/listStudents");
    }
 
    @RequestMapping(value = "/editStudent", method = RequestMethod.GET)
    public ModelAndView editStudent(HttpServletRequest request) {
        int studentId = Integer.parseInt(request.getParameter("id"));
        Student student = studentService.getStudent(studentId);
        ModelAndView model = new ModelAndView("StudentForm");
        model.addObject("student", student);
 
        return model;
    }
 
}