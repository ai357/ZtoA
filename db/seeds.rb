# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DocumentMaster.create(status:"産前休業",
                      name:"健康保険・厚生年金保険産前産後休業取得者申出書/変更（終了）届",
                      extra:"なし",
                      submission:"日本年金機構")
DocumentMaster.create(status:"産後休業",
                      name:"健康保険・厚生年金保険産前産後休業取得者申出書/変更（終了）届",
                      extra:"なし",
                      submission:"日本年金機構")
DocumentMaster.create(status:"育児休業",
                      name:"1.育児休業給付受給資格確認票・出生時育児休業給付金支給申請書\n2.雇用保険被保険者休業開始時賃金月額証明書\n3.",
                      extra:"1.出生時育児休業の開始日・賃金の額と支払状況を証明できるもの(例:賃金台帳)\n2.出産予定日・出産日を確認できるもの(例:分娩(出産)予定証明書,母子手帳コピー)",
                      submission:"事業所所在地を管轄するハローワーク")
DocumentMaster.create(name:"育児休業給付金支給申請書(1ヶ月目,2ヶ月目)",
                      extra:"賃金の額と支払い状況を証明できるもの\n(例:賃金台帳)",
                      submission:"事業所所在地を管轄するハローワーク")
DocumentMaster.create(name:"育児休業給付金支給申請書(3ヶ月目,4ヶ月目)",
                      extra:"賃金の額と支払い状況を証明できるもの\n(例:賃金台帳)",
                      submission:"事業所所在地を管轄するハローワーク")
DocumentMaster.create(name:"育児休業給付金支給申請書(5ヶ月目,6ヶ月目)",
                      extra:"賃金の額と支払い状況を証明できるもの\n(例:賃金台帳)",
                      submission:"事業所所在地を管轄するハローワーク")
DocumentMaster.create(name:"育児休業給付金支給申請書(7ヶ月目,8ヶ月目)",
                      extra:"賃金の額と支払い状況を証明できるもの\n(例:賃金台帳)",
                      submission:"事業所所在地を管轄するハローワーク")
DocumentMaster.create(name:"育児休業給付金支給申請書(9ヶ月目,10ヶ月目)",
                      extra:"賃金の額と支払い状況を証明できるもの\n(例:賃金台帳)",
                      submission:"事業所所在地を管轄するハローワーク")
DocumentMaster.create(name:"育児休業給付金支給申請書(11ヶ月目,12ヶ月目)",
                      extra:"賃金の額と支払い状況を証明できるもの\n(例:賃金台帳)",
                      submission:"事業所所在地を管轄するハローワーク")
                      
document_masters = [
  {status: nil, name: "", extra: "", submission: ""},
  {status: "", name: "", extra: "", submission: ""},
]
document_masters.each do |document_master|
  DocumentMaster.find_or_create_by(status: document_master[:status], name: document_master[:name]) do |r|
    r.extra = document_master[:extra]
    r.submission = document_master[:submission]
  end
end



admins = [
  {email: 'admin@example.com', password: 'passw@rd'},
]

admins.each do |admin|
  # 一度ユーザーをメールアドレスで検索
  admin_data = Admin.find_by(email: admin[:email])
  # 該当ユーザーがいなければ、createする
  if admin_data.nil?
    Admin.create(
      email: admin[:email],
      password: admin[:password]
    )
  end
end