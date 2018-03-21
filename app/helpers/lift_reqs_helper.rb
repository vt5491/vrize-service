module LiftReqsHelper
  def to_pt(dt)
    # p "now in ExampleLiftReqsHelper.to_pt, dt=#{dt}, dt.class=#{dt.class}, dt.to_s=#{dt.to_s}"
    Time.zone = 'Pacific Time (US & Canada)'                   # => "Hawaii"
    dt_scrubbed = dt.to_s.sub(/ UTC$/, '')
    # p "ExampleLiftReqsHelper.to_pt: dt_scrubbed=#{dt_scrubbed}"
    # t =Time.zone.parse(dt_scrubbed) # => Fri, 31 Dec 1999 14:00:00 HST -10:00^
    t = Time.zone.parse(dt_scrubbed) # => Fri, 31 Dec 1999 14:00:00 HST -10:00^
    # p "ExampleLiftReqsHelper.to_pt: t=#{t}"
    # t = DateTime.strptime(dt,'%s')
    # t = ActiveSupport::TimeZone['Pacific Time (US & Canada)'].parse(dt)
    # pt = Time.parse("07/09/10 14:50")
    # pt.in_time_zone("Pacific Time (US & Canada)")
    # @example_lift_req.updated_at_pt = pt
    t
  end
end
