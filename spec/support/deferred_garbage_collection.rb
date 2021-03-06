# frozen_string_literal: true
class DeferredGarbageCollection
  DEFERRED_GC_THRESHOLD = (ENV["DEFER_GC"] || 15.0).to_f

  @last_gc_run = Time.zone.now

  def self.start
    GC.disable
  end

  def self.reconsider
    if Time.zone.now - @last_gc_run >= DEFERRED_GC_THRESHOLD
      GC.enable
      GC.start
      GC.disable
      @last_gc_run = Time.zone.now
    end
  end
end
