#sonic pi intro
use_debug false
load_samples :guit_em9, :bd_haus

live_loop :low do
  tick
  #synth :zawa, wave: 1, phase: 0.25, release: 5, note: (knit :e1, 12, :c1, 4).look, cutoff: (line 60, 120, steps: 6).look, amp: 4
  sleep 4
end

#set_mixer_control! lpf: 130, lpf_slide: 64

with_fx :reverb, room: 1 do
  live_loop :lands, auto_cue: false do
    stop
    with_fx :lpf, cutoff: 120 do
      use_synth :tb303
      #use_random_seed 310003
      ns = (scale :c2, :minor, num_octaves: 3)
      16.times do
        tick
        play ns.choose, detune: (ring 12, 24, 36).look, release: 0.3, amp: 3, cutoff: rrand(70, 120), amp: 2, release: rrand(0, 0.2), on: (spread, 5, 9).look
        play ns.choose, detune: (ring 12, -24, -36).choose, release: rrand(0, 0.2), amp: rand + 0.5, cutoff: rrand(70, 120), amp: 5, on: (spread, 3, 7).look, amp: 1.5
        sleep 0.125
      end
    end
  end
end

live_loop :instrum do
  sleep 0.25
  #sample :guit_em9, rate: -1, amp: 5
  #sample :drum_snare_soft, 5, beat_stretch: 8, amp: 5
  sleep 7.75
end

live_loop :kick, auto_cue: true do
  sample :bd_haus, amp: 5, cutoff: 70
  sleep 0.5
end

#sample :ambi_lunar_land, rate: 0.125, amp: 2, cutoff: 130
live_loop :ind do
  #sample :loop_industrial, beat_stretch: 1, cutoff: 70
  sleep 1
end

#synth
with_fx :reverb, mix: 0.4 do
  live_loop :vocy, sync: :kick do
    use_synth :saw
    stop
    a = 0.6
    c = 50
    r = 0.5
    c2 = 60
    sample :bass_voxy_hit_c, amp: 0.4, cutoff: 110
    32.times do
      play :a1, cutoff: c, amp: a, release: r
      play :a2, cutoff: c2, amp: a, release: r
      sleep 0.25
    end
    32.times do
      play :f1, cutoff: c, amp: a, release: r
      play :f2, cutoff: c2, amp: a, release: r
      sleep 0.25
    end
    32.times do
      play :d1, cutoff: c, amp: a, release: r
      play :d2, cutoff: c2, amp: a, release: r
      sleep 0.25
    end
    32.times do
      play :f1, cutoff: c, amp: a, release: r
      play :f2, cutoff: c2, amp: a, release: r
      sleep 0.25
    end
  end
end

#lone beat one
live_loop :synth2, sync: :kick do
  stop
  a = 0.5
  p = [0.5, -0.5].choose
  use_synth :saw
  32.times do
    play :c3, amp: a, pan: p
    sleep 0.25
  end
  32.times do
    play :g3, amp: a, pan: p
    sleep 0.25
  end
  32.times do
    play :bb3, amp: a, pan: p
    sleep 0.25
  end
  32.times do
    play :c3, amp: a, pan: p
    sleep 0.25
  end
end

#lone beat two
live_loop :arpsynth, sync: :kick do
  stop
  p = 0.2
  c = 100
  a = 0.8
  r = 0.15
  use_synth :saw
  arpc = (ring :c3, :eb3, :g3, :c4, :eb4, :g4, :c5, :eb5)
  arpg = (ring :g2, :bb2, :d3, :g3, :bb3, :d4, :g4, :bb4)
  arpbb = (ring :bb2, :d3, :f3, :bb3, :d4, :f4, :bb4, :d5)
  32.times do
    play arpc.tick, release: r, pan: p, cutoff: c, amp: a
    sleep 0.25
  end
  32.times do
    play arpg.tick, release: r, pan: p, cutoff: c, amp: a
    sleep 0.25
  end
  32.times do
    play arpbb.tick, release: r, pan: p, cutoff: c, amp: a
    sleep 0.25
  end
  32.times do
    play arpc.tick, release: r, pan: p, cutoff: c, amp: a
    sleep 0.25
  end
end
