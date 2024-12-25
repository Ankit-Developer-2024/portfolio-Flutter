import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Localization extends Translations {
  static Locale englishLocal = const Locale("en", "In");

  static Locale fallBackLocal = const Locale("en", "In");

  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          "home": "Home",
          "about": "About",
          "contanct": "Contact",
          "phone": "Phone",
          "phone_no": "+91 80596-50329",
          "email": "Email",
          "user_email": "kumar990ankit@gmail.com",
          "location": "Location",
          "user_location": "Hisar , Haryana , India",
          "download_resume": "Download Resume",
          "about_me": "About Me",
          "user_about_me":
              """Recent Computer Science graduate with hands-on experience in mobile development using Flutter. Proficient in JavaScript, Node.js, and Dart, alongside version control systems like Git. Demonstratesstrong testing skills and familiarity with frameworks such as React.js and Flutter. Committed to continuous learning and mastering emerging technologies.""",
          "what_i_do": "What I do!",
          "app_development": "App Development",
          "user_app_development":
              "I am an experienced Flutter app developer skilled in creating cross-platform mobile applications using Flutter and Dart. I have worked extensively on UI/UX design, API integration, and state management using tools like GetX. My contributions include enhancing the design and functionality of apps like Just Fresh and Just Retailer, ensuring seamless performance and user satisfaction.",
          "web_development": "Web Development",
          "user_web_development":
              "I am a web developer proficient in the MERN stack, including MongoDB, Express.js, React, and Node.js. I specialize in creating responsive and dynamic web applications, integrating APIs, and managing backend operations. My expertise includes building scalable, full-stack solutions, designing websites using Flutter for cross-platform compatibility, and ensuring seamless user experiences.",
          "experience": "Experience",
          "education": "Education",
          "gju": "Guru Jambheshwar University of Science & Technology , Hisar",
          "cse": "Computer Science Engineering",
          "b_tech": "Bachelor of Technology",
          "secondary_school": "Secondary School",
          "non_medical": "Non-Medical",
          "aps": "Adarsh Public Sr. Sec. School , Fatehabad , Haryana",
          "work_skills": "Work Skills",
          "phone_:": "Phone :",
          "mail_:":"Main :",
          "form_heading":"I am always open to discussing new projects, opportunities in tech world, partnerships and more so mentorship.",
          "sumbit":"Sumbit",

            //Experience
            "flutter_developer": "Flutter Developer",
          "sde_1": "SDE-I",
          "2024": "2024",
          "company_krishiacharya": "Krishiacharya Technologies Pvt. Ltd.",
          "company_krishiacharya_with_location":
              "Krishiacharya Technologies Pvt. Ltd. Gurugram , India",
          "location_gurugram.": "Gurugram",
          "sde_1_point_1":
              "Worked on modular Warehouse Management App with features for order management, return tracking, and QR code scanning to enhance workflow efficiency. Streamlined order processing and implemented product dumping based on quality checks, significantly improving warehouse operations.",
          "sde_1_point_2":
              "Contributed to the Just Fresh and Just Retailer apps by designing and updating UI components, and testing APIs to ensure seamless integration during backend technology transitions. These apps are focused on the fruits and vegetables market",
          "sde_1_point_3":
              "Utilized Flutter and Dart to ensure high-performance applications, while collaborating with teams to improve user experience and operational efficiency.",
          "intern": "Intern",
          "feb_2024_july_2024": "Feb 2024 - July 2024",
          "intern_1_point_1":
              "As a Flutter developer intern, I specialized in crafting polished UI designs and resolving issues for JustFresh and JustRetailer apps. I also conducted POC and R&D, showcasing my proficiency in app development and problem-solving.",
        }
      };
}
