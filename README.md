# Phishing Detection Script

A simple shell script designed to analyze text files (e.g., email bodies or HTML documents) for indicators of phishing attacks. The script scans for suspicious URLs, phishing keywords, and obfuscated content like Base64 or embedded JavaScript.

---

## **Features**

- Detects **IP-based URLs** (commonly used in phishing).
- Identifies suspicious URLs containing keywords like `login`, `verify`, `password`, etc.
- Scans for phishing keywords in the document.
- Checks for HTML obfuscation techniques such as `<script>` tags or Base64 encoding.
- Generates a detailed **phishing detection report**.

---

## **Prerequisites**

- A Linux-based system with Bash shell.
- Basic permissions to execute shell scripts.
- A sample text file (e.g., email or HTML document) saved as `sample_email.txt`.

---

## **How to Use**

### 1. **Clone or Download the Script**
Download the `phishing_detection.sh` script to your local system.

### 2. **Prepare a Sample File**
Create a file named `sample_email.txt` containing the content you want to analyze. For example:

```html
Dear user,

Please verify your account immediately to avoid suspension:
http://192.168.1.1/verify-account

Click here to update your password: http://fake-login-site.com/login

Regards,
Fake Support Team
