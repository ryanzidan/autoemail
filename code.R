getwd()
setwd("D:/Penting/R/automagang")

# Packages
library(openxlsx)
library(gmailr)


# Credentials
gm_auth_configure(key = "85602115181-241150ulvfs6ggfn7km76m5h35elukig.apps.googleusercontent.com",
                  secret = "7O-F1skDuJKzRnG1BtIBxLNm")
gm_oauth_app()


# List
data = read.xlsx("tes.xlsx")
email = data$email
nama = data$nama


# isi
auto = function(mail, nama){
  gm_send_message(
    gm_mime() %>%
      gm_from("ryan.zidan.isad@gmail.com") %>%
      gm_to(mail) %>%
      gm_subject(
        paste0("Pengajuan Melakukan Program Magang")
      ) %>%
      gm_text_body(
        paste0("Yth.
Bapak/Ibu Kepala HRD
",
nama,
               
"

Dengan hormat,
                
Saya adalah seorang mahasiswa tingkat akhir program studi Ilmu Ekonomi di Universitas Indonesia. Saya mengirimkan e-mail ini dengan tujuan untuk menanyakan ketersediaan kesempatan magang di ", nama, ". Kegiatan magang ini merupakan peluang bagi saya untuk dapat mengaplikasikan ilmu yang telah dipelajari serta mengembangkan diri di bawah bimbingan Bapak/Ibu.
                
Selama masa perkuliahan, saya menyibukkan diri dengan mempelajari keterampilan pengolahan data dan pemrograman dasar serta menjadi sukarelawan dalam mengajar anak-anak tingkat SD/MI di daerah pinggiran Depok. Kegiatan-kegiatan tersebut menjadikan diri saya sebagai pribadi dengan kemampuan interpersonal yang baik, kompeten dalam menyelesaikan tantangan yang diberikan, serta adaptif terhadap lingkungan baru. Saya yakin bahwa nilai-nilai tersebut mampu mendorong diri saya untuk memberikan kontribusi pada institusi ini.
                
Pada e-mail ini terlampir CV sebagai bahan pertimbangan Bapak/Ibu. Saya akan dengan senang hati menjawab pertanyaan dan memberikan informasi/berkas tambahan yang diperlukan. Terima kasih atas kesediaan Bapak/Ibu dalam menjawab e-mail ini.


_____________
Yours sincerely,

Ryan Zidan Is'ad
Undergraduate Economics Student
Universitas Indonesia
Mobile: (+62) 812-1094-8705")
      ) %>%
      gm_attach_file(file = "Curriculum Vitae Ryan Zidan Is'ad.pdf", type = "application/pdf")
  )
}

mapply(auto, email, nama)

