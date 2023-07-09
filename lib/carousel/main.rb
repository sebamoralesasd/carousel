# frozen_string_literal: true

require 'date'
require 'open-uri'
require 'pry'
require 'rmagick'
require_relative 'twitter_client'

include Magick

def px_shave(grados_r)
  return 0 unless grados_r.modulo(90) != 0

  case grados_r.modulo(45)
  when 0..14
    65
  when 15..29
    36
  when 30..44
    60
  end
end

def main
  #puts 'Empieza el script'

  grados_rotacion = DateTime.now.min * 6

  foto_perfil_rm = ImageList.new('perfil.jpg')
  foto_perfil_rm.background_color = 'none'
  edit_foto = foto_perfil_rm.rotate(grados_rotacion)

  pix_shave = px_shave(grados_rotacion)

  edit_foto = edit_foto.matte_replace(0, 0).shave(pix_shave, pix_shave).trim
  edit_foto.write('perfil_e.jpg')

  foto_perfil_raw = open('perfil_e.jpg')
  # edit_foto.display

  client.update_profile_image(foto_perfil_raw)

  #puts 'Fin!'
end

main
