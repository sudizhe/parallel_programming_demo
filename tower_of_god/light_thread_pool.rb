class LightThreadPool
  MAX_THREAD_COUNT = 25

  def add_task
    sleep if Thread.list.count > MAX_THREAD_COUNT + 1 # +1 for main thread

    Thread.new do
      yield
      Thread.main.wakeup
    end
  end

  def join_threads
    Thread.list.each_with_index{|thread, index|
      thread.join if thread != Thread.main
    }
  end
end
