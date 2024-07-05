import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import ssl
from tkinter import Tk, simpledialog


smtp_server = "smtp.gmail.com"
smtp_port = 587
sender_email = "amansinghfoujdar001@gmail.com"
password = "brguqftysvopxibk"
receiver_email = "web3.vishal@gmail.com"

def get_email_body():
    root = Tk()
    root.withdraw()  # Hide the main window
    body = simpledialog.askstring("Email Body", "Enter the body of the email:", initialvalue=body_text)
    root.destroy()
    return body

body_text = "Enter the body..."

subject = "Test Email"
body = get_email_body()
print("input body: ",body)
# Create the email message
message = MIMEText(body, "plain")
message["From"] = sender_email
message["To"] = receiver_email
message["Subject"] = subject

context = ssl.create_default_context()
try:
    with smtplib.SMTP(smtp_server, smtp_port) as server:
        server.set_debuglevel(1)  # Enable debug output
        server.starttls(context=context)
        print("Started TLS successfully.")
        server.login(sender_email, password)
        print("Login successfully!")
        server.sendmail(sender_email, receiver_email, message.as_string())
        print("Test email sent successfully!")
except Exception as e:
    print(f"Error: {e}")

