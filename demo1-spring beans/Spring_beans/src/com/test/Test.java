package com.test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.beans.Animal;
import com.beans.Person;

public class Test {
    public static void main(String[] args){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("bean.xml");//读取bean.xml中的内容
        //创建Person的引用对象
        Person p = ctx.getBean("person",Person.class);
        p.info();
        //创建Animal的引用对象
        Animal a = ctx.getBean("animal",Animal.class);
        a.info();
        ((ClassPathXmlApplicationContext) ctx).close();
    }
}
