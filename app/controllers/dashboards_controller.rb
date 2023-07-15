class DashboardsController < ApplicationController

  def index
    @karyawan_terbaik = HasilAkhir.where(ranking: 1).first
  end
end
