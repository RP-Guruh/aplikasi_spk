module ApplicationHelper
    def employeeName(id_emp)
        karyawan = Employee.find(id_emp)
        namaKaryawan = karyawan.first_name + " " + karyawan.last_name
        return namaKaryawan
    end
    def criteriaName(id_kriteria)
        kriteria = CriteriaValue.find(id_kriteria)
        namaKriteria = kriteria.keterangan
        return namaKriteria
    end
end
