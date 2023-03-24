## Application Helper

1. Fill resume and cover letter details in templates/*.html
2. Copy & paste templates/*.html to appropriate string variables (resume & cover_letter) in generate.rb
3. Input a list of company names as an array or a .csv file

```ruby
# Array format
EMPLOYERS_LIST = [["company name", "optional email", "optional website"]]
```
4. Run `ruby generate.db` to create folders containing an email template text file, resume pdf, and cover letter pdf for easier job applications.

<details>
<summary>Generated PDFs</summary>
<img width="392" alt="resume" src="https://user-images.githubusercontent.com/59973863/225799403-c8267984-e117-4a59-8372-74603ed75812.png">
<img width="394" alt="cover_letter" src="https://user-images.githubusercontent.com/59973863/225799433-0f2ab699-2fc5-4301-b3f6-c448f69ef538.png">
</details>

### Uses

- Ruby
- [Grover](https://github.com/Studiosity/grover)
