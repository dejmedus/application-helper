require 'Grover'
require 'fileutils'
require 'csv'

# data format
# [["company name", "email", "website"]]

# from csv file (excel spreadsheets can be saved as .csv)
# EMPLOYERS_LIST = CSV.read("to_apply.csv") 

# from array
EMPLOYERS_LIST = [["Company 1", "company@email.com", "www.company.com"]]


for employer in EMPLOYERS_LIST
  
  company_name = employer[0]
  company = company_name.chomp().gsub(" ", "_")

  email = "no email"
  if employer[1] != nil 
    email = employer[1]
  end

  website = "no website"
  if employer[2] != nil 
    website = employer[2]
  end

  def render_pdf(company, resume, cover_letter, email, info)
    dirname = "generated/#{company}"
    Dir.mkdir(dirname) unless File.exist?(dirname)

    cover = Grover.new(cover_letter, format: 'A4').to_pdf
    File.write("generated/#{company}/First_Last_#{company}.pdf", cover);

    # copy resume from root
    # FileUtils.cp('First_Last_resume.pdf', "generated/#{company}/First_Last_#{company}_resume.pdf")

    # or
    # create resume from html string
    resume = Grover.new(resume, format: 'A4').to_pdf
    File.write("generated/#{company}/First_Last_#{company}_resume.pdf", resume);

    File.write("generated/#{company}/email_template.txt", email)

    File.write("generated/#{company}/#{company}.txt", info)
  end

  email = "Good Afternoon,

I am a lorem ipsum I would be very interested in speaking with you about lorem ipsuming with the #{company_name} team. Please see my attached resume and cover letter.

Best regards,

Firstname Lastname"

info = "#{company_name}
#{email_address}
#{website}"

  cover_letter = "<!DOCTYPE html>
  <html lang='en'>
  <head>
      <meta charset='UTF-8'>
      <link rel='stylesheet' href='styles.css'>
      <link rel='preconnect' href='https://fonts.googleapis.com'>
      <link rel='preconnect' href='https://fonts.gstatic.com' crossorigin>
      <link href='https://fonts.googleapis.com/css2?family=Mulish:wght@200;300;400;600;700&display=swap' rel='stylesheet'>
      <style>
      * {
          padding: 0;
          margin: 0;
        }
        h1,
        h2 {
          font-size: 17px;
          padding: 2.8px 0;
        }
        h1 {
          font-weight: 800;
        }
        h2 {
          font-weight: 500;
        }
        p{
          font-size: 15px;
          margin: 1em 0;
          font-size: 16px;
          line-height: 2;
        }
        body {
          padding: 6em;
          font-family: 'Mulish', sans-serif;
          font-weight: 200;
        }
        header {
          border-bottom: 1px solid black;
          padding: 2px 0;
          margin-bottom: 1.5em;
        }
        .signature {
          margin-bottom: 2.4em;
        }
        
      </style>
  </head>
  <body>
      <header>
      <h1>Firstname Lastname</h1>
      <h2>1 (800) 123 4567 – fullname@email.com</h2>
    </header>
    <p>Good afternoon,</p>
    <p>
      I am seeking an opportunity to lorem ipsum at #{company_name}. Lorem ipsum dolor sit amet, consectetur
      adipiscing elit. Phasellus pharetra felis venenatis purus auctor, eget feugiat ante tempor. Sed semper in est at
      pretium. Donec sed elementum felis, quis suscipit diam. Curabitur feugiat molestie rhoncus.
    </p>
    <p>
      Nulla sagittis ullamcorper cursus. Ut dignissim eget sapien eget sodales. Praesent ipsum metus, tincidunt at
      metus at, interdum sodales augue. Vestibulum ut dolor hendrerit, feugiat est et, tincidunt augue. Praesent
      convallis viverra purus, rhoncus euismod sapien commodo vitae. Vivamus nec sem id nisi condimentum interdum
      tincidunt id mauris. Donec consequat justo et justo aliquet suscipit.
    </p>
    <p>
      Proin malesuada tempor justo at egestas. Morbi molestie facilisis dolor, quis iaculis elit dapibus ac. Nulla
      facilisi. Donec in sagittis ante, vitae dictum purus. In vitae tellus in odio laoreet accumsan nec in odio.
      Donec interdum facilisis scelerisque. Nam sit amet turpis quis felis eleifend sodales. Quisque velit nisl,
      auctor eu mattis vitae, bibendum sit amet lacus.
    </p>
    <p class='signature'>Kind regards,</p>
    <p>Firstname Lastname</p>
  </body>
  </html>"

  resume = '<!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <link rel="stylesheet" href="styles.css">
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@200;300;400;600;700&display=swap" rel="stylesheet">
      <style>
          * {
              padding: 0;
              margin: 0;
          }
          h1,
          h2 {
              font-size: 17px;
              padding: 2.8px 0;
          }
          h1 {
              font-weight: 800;
          }
          h2 {
              font-weight: 500;
          }
          body {
              padding: 4em 6em;
              font-family: "Mulish", sans-serif;
              font-weight: 200;
          }
          header {
              border-bottom: 1px solid black;
              padding: 2px 0;
              margin-bottom: 1.5em;
          }
          ul {
              padding-left: 1em;
          }
          ol li {
              list-style: none;
          }
          p,
          li {
              font-size: 15px;
              padding: 1px 0;
          }
          .flex {
              display: grid;
              grid-template-columns: 1fr 3fr;
              margin: 0.4em 0;
          }
      </style>
  </head>
  <body>
      <header>
          <h1>Firstname Lastname</h1>
          <h2>1 (800) 123 4567 – fullname@email.com</h2>
      </header>
      <div class="flex">
          <h1>Education</h1>
          <div>
              <h2>
                  Title
              </h2>
              <p>
                  <em>School</em>
              </p>
              <p>Completion Date: Month, Year</p>
          </div>
      </div>
      <div class="flex">
          <h1>Skills</h1>
          <div>
              <ul>
                  <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                  <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                  <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                  <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                  <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                  <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
              </ul>
          </div>
      </div>
      <div class="flex">
          <h1>Courses</h1>
          <div>
              <h2>
                  Title
              </h2>
              <ul>
                  <li>Lorem ipsum dolor sit amet</li>
                  <li>Lorem ipsum dolor sit amet</li>
                  <li>Lorem ipsum dolor sit amet</li>
                  <li>Lorem ipsum dolor sit amet</li>
                  <li>Lorem ipsum dolor sit amet</li>
                  <li>Lorem ipsum dolor sit amet</li>
                  <li>Lorem ipsum dolor sit amet</li>
              </ul>
          </div>
      </div>
      <div class="flex">
          <h1>Experience</h1>
          <div>
              <h2>
                  Title
              </h2>
              <p>
                  <em>Role, Year-Year</em>
              </p>
              <ol>
                  <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                  <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                  <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                  <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                  <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                  <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
              </ol>
          </div>
      </div>
  </body>
  </html>'

  render_pdf company, resume, cover_letter, email, info

end