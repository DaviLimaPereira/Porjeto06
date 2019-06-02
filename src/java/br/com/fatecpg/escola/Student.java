/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.escola;

import java.util.ArrayList;

/**
 *
 * @author davil
 */
public class Student {
    private long id;
    private String name;
    private String address;
    private String phone;

    public Student(long id, String name, String address, String phone) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.phone = phone;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public static void addStudent(String name, String address, String phone) throws Exception{
        String SQL = "INSERT INTO STUDENTS VALUES(default,?,?,?)";
        Object parameters[] = {name, address, phone};
        DbConnector.execute(SQL, parameters);
    }
    
    public static void removeStudent(long id) throws Exception{
        String SQL = "DELETE FROM STUDENTS WHERE ID = ?";
        Object parameters[] = {id};
        DbConnector.execute(SQL, parameters);
    }
    
    public static ArrayList<Student> getStudents() throws Exception{
        String SQL = "SELECT * FROM students";
        ArrayList<Student> users = new ArrayList<>();
        ArrayList<Object[]> list = DbConnector.getQuery(SQL, new Object[]{});
        for(int i=0; i<list.size(); i++){
            Object row[] = list.get(i);
            Student u = new Student(
                    (long) row[0], 
                    (String) row[1], 
                    (String)row[2], 
                    (String)row[3]);
            users.add(u);
        }
        return users;
    }
    
    public static ArrayList<Student> getStudent(String names) throws Exception{
        String SQL = "SELECT * FROM students WHERE name like '%?%' order by name";
        Object parameters[] = {names};
        ArrayList<Student> students = new ArrayList<>();
        ArrayList<Object[]> list = DbConnector.getQuery(SQL, parameters);
        if(list.isEmpty()){
            return null;
        }else{
            for(int i=0; i<list.size(); i++){
            Object row[] = list.get(i);
            Student s = new Student(
                    (long) row[0], 
                    (String) row[1], 
                    (String)row[2], 
                    (String)row[3]);
            students.add(s);
            }
        return students;}
    }
}
