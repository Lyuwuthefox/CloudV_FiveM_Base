fx_version 'bodacious'
game 'gta5'

author 'DIABLES'
description 'MRPD'
version '2.0'

this_is_a_map 'yes'

data_file 'AUDIO_GAMEDATA' 'audio/diables_mrpd_garage_col_game.dat' -- dat151
data_file 'AUDIO_DYNAMIXDATA' 'audio/diables_mrpd_garage_col_mix.dat' -- dat15

files {
  'audio/diables_mrpd_garage_col_game.dat151.rel',
  'audio/diables_mrpd_garage_col_mix.dat15.rel',
}

escrow_ignore {
  'stream/v_73_v_fib_flag_a001.ydr',
  'stream/v_corp_bk_flag.ydr',
  'stream/diables_mrpd_board01.ydr'
}
dependency '/assetpacks'