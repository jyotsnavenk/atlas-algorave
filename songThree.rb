# slow trance-y song 3
atmos = "/Users/jyotsnavenkatesh/Desktop/A Drop in the Ocean.wav"

use_bpm 60

live_loop :main do
  #stop
  with_fx :echo, sample_raye: 3000 do
    sample atmos, amp: 2, rpitch: 7
    sleep 8
  end
end

live_loop :choir, sync: :main do
  stop
  16.times do
    sample :ambi_choir, amp: 0.2
    sleep 0.5
  end
end

live_loop :drone, sync: :main do
  stop
  8.times do
    sample :ambi_drone, amp: 0.1
    sleep 2
  end
end

live_loop :darkambi, sync: :main do
  stop
  use_synth :dark_ambience
  sample :bass_trance_c, amp: 0.3
  sleep 0.5
end

#piano
with_fx :echo do
  with_fx :reverb, mix: 0.7 do
    live_loop :solo do
      stop
      a = 6
      c = 90
      solo = "/Users/jyotsnavenkatesh/Desktop/velvia/spacey ambience.wav"
      sample solo, amp: a, cutoff: c
      sleep 50
    end
  end
end
