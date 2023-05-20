class CriteriaValue < ApplicationRecord
    # Berfungsi untuk menyimpan informasi tentang bobot untuk setiap kriteria penilaian.
    # contoh : tanggung jawab => 3
    # field : 
    # id | kode_kriteria | kriteria | bobot

    validates :kriteria, presence:true
    validates :keterangan, presence: true
    validates :bobot_nilai, presence: true
end
