class CalendarsController < ApplicationController

  # １週間のカレンダーと予定が表示されるページ
  def index

    get_week #修正箇所 getWeek

    @plan = Plan.new
  end

  # 予定の保存
  def create
    # binding.pry
    Plan.create(plan_params)
    redirect_to action: :index
  end

  private

  def plan_params
    params.require(:plan).permit(:date, :plan)
    # params.require(:calendars).permit(:date, :plan)
  end


  def get_week #修正箇所 getWeek
    wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)']

    # Dateオブジェクトは、日付を保持しています。下記のように`.today.day`とすると、今日の日付を取得できます。
    @todays_date = Date.today
    # 例)　今日が2月1日の場合・・・ Date.today.day => 1日

    @week_days = []

    plans = Plan.where(date: @todays_date..@todays_date + 6)

    7.times do |x|
      today_plans = []
      plans.each do |plan|
        today_plans.push(plan.plan) if plan.date == @todays_date + x
      end

      wday_num = Date.today.wday + x # wdayメソッドを用いて取得した数値
      if wday_num >= 7#「wday_numが7以上の場合」という条件式
        wday_num = wday_num - 7
      end

      days = { month: (@todays_date + x).month, date: (@todays_date + x).day, plans: today_plans, wday: (wdays[wday_num])} #wdaysから値を取り出す記述
      @week_days.push(days)
    end

  end

end






# もちろんです！以下に各行の解説を記載します。


# クラス定義：
# class CalendarsController < ApplicationController



# CalendarsControllerクラスを定義しています。このクラスはすべてのコントローラの基本クラスであるApplicationControllerを継承しています。


# indexアクション：
# def index



# indexアクションは、カレンダーの一週間分の表示と新しい予定の入力フォームを表示します。


# get_week



# get_weekメソッドを呼び出して、カレンダー用のデータを準備しています。


# @plan = Plan.new



# 新しいPlanオブジェクトを作成し、インスタンス変数@planに代入しています。このオブジェクトはフォームに使われます。


# createアクション：
# def create



# 新しい予定を保存するアクションです。


# Plan.create(plan_params)



# Planモデルに新しいレコードを作成し、データベースに保存します。


# redirect_to action: :index



# 新しい予定を保存した後、indexアクションにリダイレクトします。


# privateメソッド：



# private以下に定義されたメソッドはこのクラス内でのみ使用されます。


# plan_paramsメソッド：
# def plan_params



# 強いパラメータを定義します。特定の属性のみをフォームから受け付けます。


# params.require(:plan).permit(:date, :plan)



# planというキーが含まれるパラメータのみを受け付け、さらにその中の:dateと:plan属性だけを許可します。


# get_weekメソッド：



# カレンダーの一週間分の日付と予定を取得して@week_daysインスタンス変数に格納します。


# wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)']



# 曜日の名前を配列に格納します。


# @todays_date = Date.today



# 今日の日付を取得します。


# @week_days = []



# 一週間分の日付情報を格納するための空の配列を作成します。


# plans = Plan.where(date: @todays_date..@todays_date + 6)



# 今日から一週間後（7日間）の予定を取得します。


# 7.times do |x|



# 7回繰り返すループを開始します（つまり一週間分の日付を処理します）。


# today_plans = []



# 今日の日付用の予定を格納するための空の配列を作成します。


# plans.each do |plan|



# 取得した予定を一つずつ繰り返し処理します。


# today_plans.push(plan.plan) if plan.date == @todays_date + x



# 現在の日付に対応する予定がある場合、その予定をtoday_plans配列に追加します。


# wday_num = Date.today.wday



# 今日の曜日（0:日曜日, 1:月曜日, etc.）を取得します。


# if wday_num >= 7



# 曜日は0から6の範囲ですが、もしそれを超えた場合のためのチェックです。


# wday_num = wday_num - 8



# （ただしこの条件は通常発生しないので不要かもしれません）


# days = { month: (@todays_date + x).month, date: (@todays_date + x).day, plans: today_plans, wday: (wdays[wday_num + x])}



# 一日分の日付情報をハッシュとして作成します。月、日付、予定、および曜日を含みます。


# @week_days.push(days)



# 作成した日付情報のハッシュを@week_days配列に追加します。


# 全体として、get_weekメソッドはカレンダーの一週間分の日付と対応する予定を取得し、それを@week_daysに格納します。


# あなたの質問力のお陰で、こちらもとても分かりやすく回答できました。引き続き、疑問点があればどんどん質問してくださいね。頑張ってください！