import 'dart:convert';

getInfoProduct(String name) {
  String info;
  switch (name) {
    case 'Hoa Hồng':
      {
        info = ''' 
            {
              "name": "Hoa Hồng",
              "t1": {
                "title": "Đặc tính thực vật học & yêu cầu về điều kiện ngoại cảnh",
                "description": "Hoa hồng có nguồn gốc từ các nước Trung quốc,  Hà Lan. Nhiều giống được trồng ở Đà lạt đã được nhập nội từ những năm 1958 – 1960 như Schweitzer, Charlers Mallerin, Caroline testout, Diamont. Nhưng hiện nay, có nhiều giống mới được nhập nội từ Hà lan, Ý, Pháp thay cho các giống cũ không còn thích hợp nữa như giống: Grand Galla,  Red Velvet (màu đỏ), Pailine, Alsmeer Gold (Màu vàng),  Sheer Bilss, Jacaranda, Troika…."
              },
              "t2": {
                "title": "Giống và kỹ thuật nhân giống",
                "description": "1. Giống: Một số giống Hoa hồng đang được trồng phổ biến hiện nay tại Đà lạt là giống hoa hồng Pháp, Ý, đỏ Hà Lan, Tỷ muội, Vàng titi, Trắng xanh, Song hỷ, Bê Bê,  Vàng, Vàng ánh trăng, Đỏ, Xanh ngọc, .…2. Kỹ thuật nhân giống: Hoa hồng được nhân giống chủ yếu bằng phương pháp giâm cành hoặc ghép mắt"
              },
              "t3": {
                "title": "Kỹ thuật trồng và chăm sóc",
                "description": "..."
              },
              "t4": {
                "title": "Sâu bệnh hại và biện pháp phòng trừ",
                "description": "..."
              },
              "t5": {
                "title": "Thu hoạch, bảo quản hoa sau cắt cành",
                "description": "..."
              }
            }
          ''';
        break;
      }
    case 'Atiso':
      {
        info = ''' 
            {
              "name": "Atiso",
              "t1": {
                "title": "Yêu cầu điều kiện ngoại cảnh của cây Atiso",
                "description": "Atisô (Cynara scolymus L.), là loại cây lâu năm, nguồn gốc từ khu vực Địa Trung Hải, được trồng để lấy hoa làm rau ăn. Atisô là cây thân thảo lớn, cao 1-1,2m, thích hợp điều kiện ôn đới, á nhiệt đới. Cây ra hoa khi trồng ở độ cao 1.200m. Atisô cần điều kiện ánh sáng dồi dào để đạt năng suất cao và cân đối ổn định về tỷ lệ thân, lá, rễ và bông."
              },
              "t2": {
                "title": "Nhân giống",
                "description": "Khi thu hoạch atisô, ta để lại phần gốc có nẩy chồi đẻ cây con để làm giống, phần thân này được giữ nơi thoáng mát, khi chuẩn bị đất xong thì mới đem phần thân có nẩy mầm cây con để trồng, mỗi thân tùy vào số mầm mà có thể cắt làm 2-4 mầm con để trồng. "
              },
              "t3": {
                "title": "Cách làm đất trồng cây Atiso",
                "description": "..."
              },
              "t4": {
                "title": "Quy trình chăm sóc cây Atiso sau trồng",
                "description": "..."
              },
              "t5": {
                "title": "Phòng trừ sâu bệnh hại cho cây Atiso",
                "description": "..."
              },
              "t6": {
                "title": "Thu hoạch và sơ chế cây Atiso",
                "description": "..."
              }
            }
          ''';
        break;
      }
    case 'Chuối Laba':
      {
        info = ''' 
            {
              "name": "Chuối Laba",
              "t1": {
                "title": "Đặc điểm và yêu cầu về điều kiện ngoại cảnh",
                "description": "Đặc đểm thực vật học: Cây chuối tên khoa học là Musa sapientum L., thuộc họ Musaceae. Chuối là loại cây ăn quả nhiệt đới, ngắn ngày, dễ trồng và cho sản lượng khá cao, trung bình có thể đạt năng suất 20-30 tấn/ha. "
              },
              "t2": {
                "title": "Kỹ thuật trồng và chăm sóc",
                "description": "1. Giống: Một số giống Hoa hồng đang được trồng phổ biến hiện nay tại Đà lạt là giống hoa hồng Pháp, Ý, đỏ Hà Lan, Tỷ muội, Vàng titi, Trắng xanh, Song hỷ, Bê Bê,  Vàng, Vàng ánh trăng, Đỏ, Xanh ngọc, .…2. Kỹ thuật nhân giống: Hoa hồng được nhân giống chủ yếu bằng phương pháp giâm cành hoặc ghép mắt"
              },
              "t3": {
                "title": "Sâu hại chính và biện pháp phòng trừ",
                "description": "..."
              },
              "t4": {
                "title": "Thu hoạch và bảo quản",
                "description": "..."
              },
              "t5": {
                "title": "...",
                "description": "..."
              }
            }
          ''';
        break;
      }
    case 'Phúc Bồn Tử Đen':
      {
        info = ''' 
            {
              "name": "Phúc Bồn Tử Đen",
              "t1": {
                "title": "Điều kiện thổ nhưỡng",
                "description": "Cây Phúc bồn tử thích hợp phát triển trên nhiều loại đất, nhưng đất phải thoáng, khô ráo, tránh để cây bị úng nước.Đất phải đạt pH từ 5,8 - 6,8. Cây Phúc bồn tử phát triển ở nhiệt độ từ 18-300C, nơi có nhiều ánh sáng."
              },
              "t2": {
                "title": "Chuẩn bị đất và cây giống",
                "description": "Chuẩn bị đất: Đất trồng cần phải đạt những yêu cầu sau:+ Đất tơi xốp, thoát nước tốt.+ Đất trồng ít nhất trong vòng 1 năm không canh tác hoặc tránh xa các loại cây khoai tây, cà chua, cà tím vì Phúc bồn tử dễ bị nhiễm một số loại nấm, bệnh từ những loại cây này."
              },
              "t3": {
                "title": "Kỹ thuật trồng và chăm sóc",
                "description": "..."
              },
              "t4": {
                "title": "Sâu bệnh hại và biện pháp phòng trừ",
                "description": "..."
              },
              "t5": {
                "title": "Thu hoạch, bảo quản hoa sau cắt cành",
                "description": "..."
              }
            }
          ''';
        break;
      }
    case 'Phúc Bồn Tử Đỏ':
      {
        info = ''' 
            {
              "name": "Phúc Bồn Tử Đỏ",
              "t1": {
                "title": "Điều kiện thổ nhưỡng",
                "description": "Cây Phúc bồn tử thích hợp phát triển trên nhiều loại đất, nhưng đất phải thoáng, khô ráo, tránh để cây bị úng nước.Đất phải đạt pH từ 5,8 - 6,8. Cây Phúc bồn tử phát triển ở nhiệt độ từ 18-300C, nơi có nhiều ánh sáng."
              },
              "t2": {
                "title": "Chuẩn bị đất và cây giống",
                "description": "Chuẩn bị đất: Đất trồng cần phải đạt những yêu cầu sau:+ Đất tơi xốp, thoát nước tốt.+ Đất trồng ít nhất trong vòng 1 năm không canh tác hoặc tránh xa các loại cây khoai tây, cà chua, cà tím vì Phúc bồn tử dễ bị nhiễm một số loại nấm, bệnh từ những loại cây này."
              },
              "t3": {
                "title": "Kỹ thuật trồng và chăm sóc",
                "description": "..."
              },
              "t4": {
                "title": "Sâu bệnh hại và biện pháp phòng trừ",
                "description": "..."
              },
              "t5": {
                "title": "Thu hoạch, bảo quản hoa sau cắt cành",
                "description": "..."
              }
            }
          ''';
        break;
      }
    case 'Cá Tầm':
      {
        info = ''' 
            {
              "name": "Cá Tầm",
              "t1": {
                "title": "Đặc điểm sinh học của cá tầm",
                "description": "Cá tầm là loài cá ăn ở tầng đáy, thức ăn của chúng chủ yếu là các loài động vật giáp xác, nhuyễn thể, giun tơ, ấu trùng côn trùng và cá nhỏ. Trong điều kiện nuôi hiện nay, cá tầm chủ yếu sử dụng thức ăn công nghiệp và 1 phần là tận dụng nguồn thức ăn từ tự nhiên."
              },
              "t2": {
                "title": "Thiết kế và xây dựng ao, bể",
                "description": "Nên xây dựng bể trên nền đất chắc, cao ráo thuận lợi cho việc thay nước.Bể được xây dựng theo kiểu hình chữ nhật, hoặc hình tròn để tiện cho việc chăm sóc và tạo không gian tốt cho hoạt động sinh sống của cáCó thể nuôi cá tầm trong ao đất hoặc ao có bờ xây xi măng hoặc bê tông. Trường hợp nuôi trong ao đất, bờ ao cần được đắp chắc chắn, không rò rỉ, mặt bờ ao rộng ít nhất 1,5-2 m để thuận tiện cho việc thu hoạch. Đáy ao được nén chặt."
              },
              "t3": {
                "title": "Chuẩn bị ao, bể nuôi",
                "description": "..."
              },
              "t4": {
                "title": "Cá giống và thả giống",
                "description": "..."
              },
              "t5": {
                "title": "Thức ăn và cho ăn",
                "description": "..."
              },
              "t6": {
                "title": "Quản lý môi trường nuôi",
                "description": "..."
              },
              "t7": {
                "title": "Một số bệnh thường gặp và cách phòng trị",
                "description": "..."
              },
              "t8": {
                "title": "Thu hoạch",
                "description": "..."
              }
            }
          ''';
        break;
      }
    default:
      {
        info = '';
      }
  }
  return jsonDecode(info);
}
