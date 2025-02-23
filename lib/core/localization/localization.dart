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
          "projects": "Projects",
          "skills": "Skills",
          "phone": "Phone",
          "phone_no": "+91 80596-50329",
          "email": "Email",
          "user_email": "kumar990ankit@gmail.com",
          "location": "Location",
          "user_location": "Hisar , Haryana , India",
          "download": "Download",
          "resume": " Resume",
          "resume_": "Resume",
          "about_me": "About Me",
          "user_about_me":
              """Recent Computer Science graduate with hands-on experience in mobile development using Flutter. Proficient in JavaScript, Node.js, and Dart, alongside version control systems like Git. Demonstratesstrong testing skills and familiarity with frameworks such as React.js and Flutter. Committed to continuous learning and mastering emerging technologies.""",
          "what_i_do": "What I do!",
          "app_development": "App Development",
          "user_app_development_part1":
              "I am an experienced Flutter app developer skilled in creating cross-platform mobile applications using",
          "user_app_development_part2": " Flutter and Dart. ",
          "user_app_development_part3":
              "I have worked extensively on UI/UX design, API integration, and state management using tools like GetX. My contributions include enhancing the design and functionality of apps like Just Fresh and Just Retailer, ensuring seamless performance and user satisfaction.",
          "web_development": "Web Development",
          "user_web_development_part1":
              "I am a web developer proficient in the MERN stack, including",
          "user_web_development_part2":
              " MongoDB, Express.js, React, and Node.js ",
          "user_web_development_part3":
              "I specialize in creating responsive and dynamic web applications, integrating APIs, and managing backend operations. My expertise includes building scalable, full-stack solutions, designing websites using Flutter for cross-platform compatibility, and ensuring seamless user experiences.",
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
          "mail_:": "Mail :",
          "form_heading":
              "I am always open to discussing new projects, opportunities in tech world, partnerships and more so mentorship.",
          "send_msg": "Send Message",

          //Experience
          "flutter_developer": "Flutter Developer",
          "sde_1": "SDE-I",
          "2024": "2024",
          "company_krishiacharya": "Krishiacharya Technologies Pvt. Ltd.",
          "company_krishiacharya_with_location":
              "Krishiacharya Technologies Pvt. Ltd. Gurugram , India",
          "location_gurugram": "Gurugram",
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

          //edit Mode
          "image_or_icon": "Image/Icon:",
          "pick_image": "Pick Image",
          "pick_images": "Pick Images",
          "pick_resume": "Pick Resume",
          "are_you_sure_delete": "Are you sure you want to delete ",
          //sidebar info dialogbox

          "user_data": "User Data",
          "user_name": "Name:",
          "user_tech_stack": "Tech Stack:",
          "user_linkedIn_url": "LinkedIn Url:",
          "user_github_url": "Github Url:",
          "user_phone_number": "Phone No.:",
          "user_email_title": "Email:",
          "user_location_title": "Location:",
          "user_location_url_title": "Location Url:",
          "user_image_required": "User image is required.",
          "user_resume_required": "User resume is required.",

          //home dialogbox
          "user_about_me_data": "About Me Data",
          "user_what_i_do_data": "What I do Data",
          "user_about_me_desc": "About Me Desc.:",
          "user_what_i_do": "What I do",
          "user_what_i_do_title": "Title:",
          "user_what_i_do_desc": "Description:",
          "user_what_i_do_desc_highlight_words": "Description highlight words",

          //experience dialogbox
          "user_experience_data": "Experience Data",
          "user_tech_stack_in_comapny": "Tech Stack in company:",
          "user_designation_in_company": "Designation in company:",
          "user_company_name": "Company Name:",
          "user_company_location": "Company Location:",
          "user_company_experience": "Your experience in company/Your work:",
          "user_in_curr_role_or_not": "I am currently working in this role",
          "start_date": "Start Date:",
          "end_date": "End Date:",
          "both_date_required": "Start and end dates are required",
          "start_date_required": "Start date is required",
          "end_date_not_pick_correct":
              "End date year must be same or greater than current year.",

          "at_least_one_point_req": "At least one point is required",

          //skill dialogbox string
          "user_skill_data": "Skill Data",
          "user_skill_name": "Skill:",
          "user_skill_image_req": "Image is required",

          //project dialogbox string
          "user_project_data": "Project Data",
          "user_project_name": "Project Name:",
          "user_development_fields": "Development Field:",
          "user_technology_stack": "Technology Stack:",
          "user_project_url": "Project Url:",
          "user_peoject_image_min_req": "Minimum 4 image is required",
          "user_peoject_image_max_req": "Maximum 10 images allowed. ",
          "project_description": "Project Description:",

          // info/user/guid msg
          "user_fetch_succ": "Your data fetch successfully",
          "user_fetch_not_succ":
              "Your data fetch is not successfully or may be we have no data.",

          "user_tech_stack_not_succ":
              "Teck stack could not be fetched successfully, or there may be no data available.",

          "user_experience_not_succ":
              "Experience could not be fetched successfully, or there may be no data available.",

          "user_skills_not_succ":
              "Skills could not be fetched successfully, or there may be no data available.",

          "user_project_not_succ":
              "Projects could not be fetched successfully, or there may be no data available.",

          "info_upload_succ": "Information upload successfully",
          "info_upload_not_succ": "Information is not upload successfully",
          "info_update_succ": "Information updated successfully",
          "info_update_not_succ": "Information is not updated successfully",
          "about_me_update_succ":
              "Your About me section has been updated successfully",
          "about_me_update_not_succ":
              "Your About me section has not been update successfully",
          "user_not_create_yet": "User is not create yet, please first create.",

          "tech_stack_upload_succ":
              "Your teck stack has been upload successfully",
          "tech_stack_upload_not_succ":
              "Your teck stack has not been upload successfully",
          "tech_stack_updated_succ":
              "Your teck stack has been updated successfully",
          "tech_stack_updated_not_succ":
              "Your teck stack has not been updated successfully",
          "tech_stack_delete_succ":
              "Your teck stack has been successfully deleted",
          "tech_stack_delete_not_succ":
              "Your teck stack has not been successfully deleted",

          "experience_upload_succ":
              "Your experience has been upload successfully",
          "experience_upload_not_succ":
              "Your experience has not been upload successfully",
          "experience_updated_succ":
              "Your experience has been updated successfully",
          "experience_updated_not_succ":
              "Your experience has not been updated successfully",
          "experience_delete_succ":
              "Your experience has been successfully deleted",
          "experience_delete_not_succ":
              "Your experience has not been successfully deleted",

          "skill_upload_succ": "Your skill has been upload successfully",
          "skill_upload_not_succ":
              "Your skill has not been upload successfully",
          "skill_updated_succ": "Your skill has been updated successfully",
          "skill_updated_not_succ":
              "Your skill has not been updated successfully",
          "skill_delete_succ": "Your skill has been successfully deleted",
          "skill_delete_not_succ":
              "Your skill has not been successfully deleted",

          "project_upload_succ": "Your project has been upload successfully",
          "project_upload_not_succ":
              "Your project has not been upload successfully",
          "project_updated_succ": "Your project has been updated successfully",
          "project_updated_not_succ":
              "Your project has not been updated successfully",
          "project_delete_succ": "Your project has been successfully deleted",
          "project_delete_not_succ":
              "Your project has not been successfully deleted",

          "img_data_fetch_not_succ":
              "Your image data fetch is not successfully",
        }
      };
}
