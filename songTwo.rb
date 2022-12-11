#one trancea
use_bpm 125

live_loop :met1 do
  sleep 1
end

cmaster1 = 120
cmaster2 = 100
cmaster3 = 100

#kick
live_loop :kick, sync: :met1 do
  stop
  a = 2
  20.times do
    4.times do
      kick = "/Users/jyotsnavenkatesh/Desktop/Garde/kick.wav"
      sample kick, amp: a, cutoff: cmaster1
      sleep 1
    end
  end
  sleep 5
end

#clap
with_fx :reverb, mix: 0.6 do
  live_loop :clap, sync: :met1 do
    stop
    a = 2
    p = 0.2
    c = 50
    clap = "/Users/jyotsnavenkatesh/Desktop/Garde/lofi clap.wav"
    sleep 1
    sample clap, amp: a, pan: p, cutoff: c
    sleep 1
  end
end

#cymbal
##| with_fx :reverb, mix: 0.6 do
live_loop :HHC1, sync: :met1 do
  stop
  a = 0.5
  p = 0.2
  f = 0.5
  hhc = :drum_cymbal_closed
  2.times do
    sample hhc, amp: a, pan: p, finish: f
    sleep 0.25
  end
  2.times do
    sample hhc, amp: 0.1, pan: p, finish: f
    sleep 0.25
  end
end

#beat one
with_fx :reverb, mix: 0.6 do
  with_fx :flanger do
    live_loop :square, sync: :met1 do
      stop
      a = 0.5
      c = 80
      r = 0.25
      p = line(-0.85, 0.85, steps: 32).mirror.tick
      use_synth :square
      tick
      #notes = (ring :b4, :e5, :d5)#.shuffle
      play notes.look, amp: a, cutoff: c, pan: p, release: r
      sleep 0.25
    end
  end
end

#beat two
with_fx :reverb do
  with_fx :bitcrusher do
    live_loop :shake, sync: :met1 do
      stop
      r = 2
      a = 0.1
      p = -0.3
      shake = "/Users/jyotsnavenkatesh/Desktop/Garde/reese.wav"
      8.times do
        sample shake, rate: r, amp: a, cutoff: cmaster2, pan: p
        sleep 0.25
      end
      sample shake, rate: 1.5, amp: a, cutoff: cmaster2, pan: p
      sleep 0.5
      6.times do
        sample shake, rate: r, amp: a, cutoff: cmaster2, pan: p
        sleep 0.25
      end
    end
  end
end

#string notes
with_fx :reverb, mix: 0.5 do
  live_loop :rand, sync: :met1 do
    stop
    p = 0.25
    a = 0.9
    r = line(0.1, 0.4, steps: 256).mirror.tick
    notes = (ring :g4, :e4, :a3, :g3, :e3)
    #notes = (ring :e3, :g3, :b3, :d4, :e4, :g4, :b4, :d5)#.shuffle
    use_synth :square
    play notes.shuffle.tick, amp: a, cutoff: 70, release: r, pan: p
    sleep 0.25
  end
end

#song maybe
live_loop :hhc, sync: :met1 do
  stop
  r = 1
  a = 0.5
  p = -0.3
  trancea = "/Users/jyotsnavenkatesh/Desktop/Garde/trancea.wav"
  8.times do
    sample trancea, rate: r, amp: a, cutoff: cmaster2, pan: p
    sleep 0.25
  end
  sample trancea, rate: 0.75, amp: a, cutoff: cmaster2, pan: p
  sleep 0.5
  6.times do
    sample trancea, rate: r, amp: a, cutoff: cmaster2, pan: p
    sleep 0.25
  end
end

#song addition
live_loop :hho, sync: :met1 do
  stop
  hho = "/Users/jyotsnavenkatesh/Desktop/Garde/trancea 2.wav"
  sleep 0.5
  sample hho, cutoff: cmaster3, pan: -0.2, amp: 0.7
  sleep 0.5
end

#melody one
##| delay: 16
with_fx :eq, high_q: 1, low_q: 1, low_shelf_slope: 1 do
  live_loop :synth_bass_01, sync: :met1 do
    stop
    a = 1
    c = 120
    r = 0.3
    use_synth :fm
    ##| 6.times do
    32.times do
      play :e2, cutoff: c, amp: a, release: r
      play :e3, cutoff: c, amp: a, release: r
      sleep 0.25
    end
    28.times do
      play :g2, cutoff: c, amp: a, release: r
      play :g3, cutoff: c, amp: a, release: r
      sleep 0.25
    end
    play :a2, cutoff: c, amp: a, release: r
    play :a3, cutoff: c, amp: a, release: r
    sleep 0.25
    play :b2, cutoff: c, amp: a, release: r
    play :b3, cutoff: c, amp: a, release: r
    sleep 0.25
    play :a2, cutoff: c, amp: a, release: r
    play :a3, cutoff: c, amp: a, release: r
    sleep 0.25
    play :g2, cutoff: c, amp: a, release: r
    play :g3, cutoff: c, amp: a, release: r
    sleep 0.25
    ##| end
    ##| sleep 64
  end
end

#melody two
##| , delay: 144
live_loop :synth_bass_02, sync: :met1 do
  stop
  a = 1
  c = 120
  r = 0.4
  use_synth :fm
  ##| 4.times do
  32.times do
    play :e2, cutoff: c, amp: a, release: r
    play :e3, cutoff: c, amp: a, release: r
    sleep 0.25
  end
  32.times do
    play :g2, cutoff: c, amp: a, release: r
    play :g3, cutoff: c, amp: a, release: r
    sleep 0.25
  end
  28.times do
    play :a2, cutoff: c, amp: a, release: r
    play :a3, cutoff: c, amp: a, release: r
    sleep 0.25
  end
  2.times do
    play :b2, cutoff: c, amp: a, release: r
    play :b3, cutoff: c, amp: a, release: r
    sleep 0.25
  end
  2.times do
    play :a2, cutoff: c, amp: a, release: r
    play :a3, cutoff: c, amp: a, release: r
    sleep 0.25
  end
  32.times do
    play :e2, cutoff: c, amp: a, release: r
    play :e3, cutoff: c, amp: a, release: r
    sleep 0.25
  end
  ##| end
  ##| sleep 64
end

#notes
with_fx :reverb , mix: 0.6 do
  with_fx :flanger, mix: 0.4 do
    live_loop :synth_bass, sync: :met1 do
      stop
      a = 0.4
      c = 78
      s = 8
      use_synth :saw
      play :a2, sustain: s, cutoff: c, amp: a
      sleep 8
      play :g2, sustain: s, cutoff: c, amp: a
      sleep 8
      play :e2, sustain: s, cutoff: c, amp: a
      sleep 8
      play :f2, sustain: s, cutoff: c, amp: a
      sleep 8
    end
  end
end

###################################################
