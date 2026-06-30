-- =========================
-- DATABASE
-- =========================
CREATE DATABASE SuMonDB;
GO

USE SuMonDB;
GO

-- =========================
-- TABLE DYNATIES
-- =========================
CREATE TABLE Dynasties (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100),
    founder NVARCHAR(100),
    startYear INT,
    endYear INT,
    capital NVARCHAR(100),
    description NVARCHAR(MAX),
    image NVARCHAR(255)
);
GO

CREATE TABLE dynasty_character (
    dynasty_id INT,
    character_id INT,
    PRIMARY KEY (dynasty_id, character_id)
);

-- =========================
-- TABLE CHARACTERS
-- =========================
CREATE TABLE Characters (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,

    dynasty NVARCHAR(255),
    dynasty_id INT,

    description NVARCHAR(1000),
    biography NVARCHAR(MAX),
    achievement NVARCHAR(MAX),

    birth_place NVARCHAR(255),
    historical_site NVARCHAR(255),

    image NVARCHAR(255),
    youtube_link NVARCHAR(500),

    timelineOrder INT NOT NULL,
    avgRating FLOAT DEFAULT 0,

    CONSTRAINT FK_Characters_Dynasties
        FOREIGN KEY (dynasty_id)
        REFERENCES Dynasties(id)
);
GO

-- =========================
-- TABLE CHARACTER EVENTS
-- =========================
CREATE TABLE CharacterEvents (
    id INT IDENTITY(1,1) PRIMARY KEY,
    character_id INT NOT NULL,

    year NVARCHAR(50),
    title NVARCHAR(255),
    description NVARCHAR(1000),

    FOREIGN KEY (character_id)
        REFERENCES Characters(id)
        ON DELETE CASCADE
);
GO


-- =========================
-- TABLE BATTLE LOCATIONS
-- =========================
CREATE TABLE BattleLocations (
    id INT IDENTITY(1,1) PRIMARY KEY,
    character_id INT NOT NULL,

    name NVARCHAR(255),
    lat FLOAT,
    lng FLOAT,
    description NVARCHAR(500),

    FOREIGN KEY (character_id)
        REFERENCES Characters(id)
        ON DELETE CASCADE
);
GO

-- =========================
-- TABLE USERS
-- =========================
CREATE TABLE Users (
    id INT IDENTITY(1,1) PRIMARY KEY,

    username NVARCHAR(50) NOT NULL UNIQUE,
    password NVARCHAR(255) NOT NULL,

    fullname NVARCHAR(100) NOT NULL,
    role NVARCHAR(20) NOT NULL DEFAULT 'USER',

    avatar NVARCHAR(255)
);
GO

-- =========================
-- TABLE FAVORITE
-- =========================
CREATE TABLE Favorite (
    user_id INT NOT NULL,
    character_id INT NOT NULL,

    created_at DATETIME DEFAULT GETDATE(),

    PRIMARY KEY (user_id, character_id),

    FOREIGN KEY (user_id)
        REFERENCES Users(id)
        ON DELETE CASCADE,

    FOREIGN KEY (character_id)
        REFERENCES Characters(id)
        ON DELETE CASCADE
);
GO

-- =========================
-- TABLE COMMENT
-- =========================
CREATE TABLE Comment (
    id INT IDENTITY(1,1) PRIMARY KEY,

    user_id INT NOT NULL,
    character_id INT NOT NULL,

    content NVARCHAR(MAX) NOT NULL,
    score INT NOT NULL CHECK (score BETWEEN 1 AND 5),

    created_at DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (user_id)
        REFERENCES Users(id)
        ON DELETE CASCADE,

    FOREIGN KEY (character_id)
        REFERENCES Characters(id)
        ON DELETE CASCADE
);
GO
select * from Comment
-- =========================
-- TABLE HISTORY
-- =========================
CREATE TABLE History (
    id INT IDENTITY(1,1) PRIMARY KEY,

    user_id INT NOT NULL,
    character_id INT NOT NULL,

    view_time DATETIME DEFAULT GETDATE(),

    CONSTRAINT UQ_user_character
        UNIQUE (user_id, character_id),

    FOREIGN KEY (user_id)
        REFERENCES Users(id)
        ON DELETE CASCADE,

    FOREIGN KEY (character_id)
        REFERENCES Characters(id)
        ON DELETE CASCADE
);
GO
CREATE TABLE FunFacts (
    id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(255),
    content NVARCHAR(MAX),
    image NVARCHAR(255),
    related_character_id INT NULL,
    related_dynasty_id INT NULL,

    FOREIGN KEY (related_character_id)
        REFERENCES Characters(id),

    FOREIGN KEY (related_dynasty_id)
        REFERENCES Dynasties(id)
);

-- =========================
-- Character
-- =========================
INSERT INTO Characters(name,dynasty,dynasty_id,description,biography,achievement,birth_place,historical_site,image,youtube_link,timelineOrder)VALUES(
N'Hùng Vương',
N'Văn Lang',
1,
N'Vị vua đầu tiên trong lịch sử dựng nước của dân tộc Việt Nam.',
N'Hùng Vương là danh hiệu được sử dụng để chỉ các vị vua thuộc thời kỳ Hồng Bàng, giai đoạn được xem là buổi đầu hình thành quốc gia và dân tộc Việt Nam. 
Theo các thư tịch cổ và truyền thống dân gian, nhà nước Văn Lang được thành lập vào khoảng thiên niên kỷ thứ nhất trước Công nguyên, với kinh đô đặt tại
Phong Châu (nay thuộc tỉnh Phú Thọ). Đây được xem là nhà nước sơ khai đầu tiên trong lịch sử Việt Nam, đánh dấu bước chuyển quan trọng từ xã hội thị tộc
sang hình thức tổ chức nhà nước sơ khai. Dưới thời các Vua Hùng, cư dân Lạc Việt sinh sống chủ yếu bằng nghề trồng lúa nước, kết hợp với chăn nuôi, đánh 
bắt thủy sản và các nghề thủ công như luyện kim đồng, dệt vải và làm gốm. Nền văn hóa Đông Sơn phát triển rực rỡ trong giai đoạn này với biểu tượng tiêu
biểu là trống đồng, phản ánh trình độ kỹ thuật, nghệ thuật và đời sống tinh thần phong phú của cư dân Việt cổ. Các truyền thuyết như Con Rồng Cháu Tiên, 
Sơn Tinh - Thủy Tinh, Thánh Gióng hay Bánh Chưng Bánh Giầy đều gắn liền với thời đại Hùng Vương và góp phần hình thành bản sắc văn hóa dân tộc. Mặc dù 
nhiều chi tiết về thời kỳ này mang tính huyền sử và chưa thể kiểm chứng hoàn toàn bằng tư liệu khảo cổ học, các Vua Hùng vẫn được tôn vinh là những người
có công dựng nên nền móng đầu tiên của quốc gia Việt Nam. Trong tâm thức dân tộc, thời đại Hùng Vương không chỉ là khởi nguồn của lịch sử đất nước mà còn 
là biểu tượng của tinh thần đoàn kết, ý chí tự chủ và truyền thống dựng nước của người Việt. Ngày Giỗ Tổ Hùng Vương mùng 10 tháng 3 âm lịch hằng năm là dịp
để nhân dân cả nước tưởng nhớ công lao của các bậc tiền nhân và khẳng định đạo lý uống nước nhớ nguồn của dân tộc.',
N'Thành lập nhà nước Văn Lang; đặt nền móng cho văn hóa Lạc Việt; phát triển nông nghiệp lúa nước; tạo tiền đề cho sự hình thành dân tộc Việt Nam.',
N'Phong Châu, Phú Thọ',
N'Khu Di tích lịch sử Quốc gia đặc biệt Đền Hùng, TP Việt Trì, Phú Thọ',
N'hung-vuong.jpg',
'nGDnoy9cuQw',
1
);
go

INSERT INTO Characters(name,dynasty,dynasty_id,description,biography,achievement,birth_place,historical_site,image,youtube_link,timelineOrder)VALUES(
N'An Dương Vương',
N'Âu Lạc',
2,
N'Vị vua sáng lập nước Âu Lạc và xây dựng thành Cổ Loa.',
N'An Dương Vương, tên thật là Thục Phán, là vị vua đã thống nhất các bộ tộc Âu Việt và Lạc 
Việt để thành lập nước Âu Lạc vào khoảng thế kỷ III trước Công nguyên. Sau khi lên ngôi, ông 
chọn Cổ Loa làm kinh đô và cho xây dựng thành Cổ Loa với quy mô lớn, được xem là công trình
quân sự đồ sộ nhất Đông Nam Á thời bấy giờ. Truyền thuyết kể rằng ông được thần Kim Quy giúp 
chế tạo nỏ thần có sức mạnh đặc biệt để bảo vệ đất nước. Tuy nhiên sau đó do mất cảnh giác trước
âm mưu của Triệu Đà, nước Âu Lạc bị thôn tính. Dù vậy, An Dương Vương vẫn được ghi nhớ là người
đặt nền móng cho nhà nước Âu Lạc và để lại dấu ấn sâu đậm trong lịch sử dân tộc.',
N'Thành lập nước Âu Lạc; Xây dựng thành Cổ Loa; Phát triển quốc gia sau thời Văn Lang.',
N'Vùng đất Âu Việt cổ',
N'Khu di tích Quốc gia đặc biệt Cổ Loa, Đông Anh, Hà Nội',
N'an-duong-vuong.jpg',
N'uXXqo-PDPv4',
2
);
go
INSERT INTO Characters(name, dynasty, dynasty_id, description, biography, achievement, birth_place, historical_site, image, youtube_link, timelineOrder)VALUES(
N'Hai Bà Trưng',
N'Bắc Thuộc',
3,
N'Hai vị nữ anh hùng dân tộc lãnh đạo cuộc khởi nghĩa chống ách đô hộ Đông Hán năm 40.',
N'Hai Bà Trưng gồm Trưng Trắc và Trưng Nhị, là con của Lạc tướng huyện Mê Linh. Sau khi Thi Sách bị giết, hai 
bà đã phất cờ khởi nghĩa năm 40, đánh đuổi quân Đông Hán và giành lại nhiều thành trì. Trưng Trắc lên ngôi vua,
trở thành nữ vương đầu tiên trong lịch sử Việt Nam. Cuộc khởi nghĩa tuy không kéo dài nhưng thể hiện tinh thần độc lập mạnh mẽ của dân tộc.',
N'Lãnh đạo khởi nghĩa năm 40; Giành lại độc lập sau thời Bắc thuộc; Trưng Trắc trở thành nữ vương đầu tiên.',
N'Mê Linh, Hà Nội',
N'Đền Hai Bà Trưng, Mê Linh, Hà Nội',
N'hai-ba-trung.jpg',
N'vqvXYvF4Yes',
3
);
go
INSERT INTO Characters(name, dynasty, dynasty_id, description, biography, achievement, birth_place, historical_site, image, youtube_link, timelineOrder)VALUES(
N'Bà Triệu',
N'Bắc Thuộc',
3,
N'Nữ anh hùng dân tộc lãnh đạo cuộc khởi nghĩa chống quân Ngô vào thế kỷ 3.',
N'Bà Triệu (Triệu Thị Trinh) sinh ra tại vùng Cửu Chân (Thanh Hóa). Từ nhỏ đã nổi tiếng mạnh mẽ, có chí khí hơn người. Năm 248, bà lãnh đạo cuộc khởi nghĩa chống lại ách đô hộ của nhà Ngô. Dù cuộc khởi nghĩa bị đàn áp, hình ảnh “Tôi muốn cưỡi cơn gió mạnh, đạp luồng sóng dữ” đã trở thành biểu tượng bất khuất của dân tộc Việt Nam.',
N'Lãnh đạo khởi nghĩa chống nhà Ngô; Biểu tượng tinh thần bất khuất; Trở thành huyền thoại dân tộc.',
N'Thanh Hóa',
N'Đền Bà Triệu, Hậu Lộc, Thanh Hóa',
N'ba-trieu.jpg',
N'6SVQ12dXV3c',
4
);
go
INSERT INTO Characters(name, dynasty, dynasty_id, description, biography, achievement, birth_place, historical_site, image, youtube_link, timelineOrder)VALUES(
N'Lý Nam Đế',
N'Nhà Tiền Lý',
4,
N'Vị vua sáng lập nước Vạn Xuân, lãnh đạo khởi nghĩa chống ách đô hộ nhà Lương.',
N'Lý Nam Đế (Lý Bí) sinh năm 503 tại vùng Thái Bình - Hà Nội ngày nay. Ông là người có tài năng quân sự và chính trị, đã đứng lên lãnh đạo cuộc khởi nghĩa chống nhà Lương vào năm 542. Năm 544, ông xưng đế, lập ra nước Vạn Xuân, đánh dấu một bước quan trọng trong lịch sử độc lập dân tộc Việt Nam. Dù sau đó gặp nhiều khó khăn và phải rút lui, ông vẫn được xem là vị vua mở đầu cho nền độc lập tự chủ lâu dài của Việt Nam.',
N'Đánh bại nhà Lương; Thành lập nước Vạn Xuân (544); Khởi đầu thời kỳ tự chủ lâu dài của dân tộc Việt Nam.',
N'Thái Bình - Hà Nội',
N'Đền thờ Lý Nam Đế, Bắc Ninh',
N'ly-nam-de.jpg',
N'iTN9Njk8O1Y',
5
);
go
INSERT INTO Characters(name, dynasty, dynasty_id, description, biography, achievement, birth_place, historical_site, image, youtube_link, timelineOrder)VALUES(
N'Khúc Thừa Dụ',
N'Tự Chủ',
5,
N'Người đặt nền móng cho thời kỳ tự chủ của dân tộc Việt Nam sau hơn 1000 năm Bắc thuộc.',
N'Khúc Thừa Dụ là một hào trưởng lớn ở Hải Dương, sống vào cuối thế kỷ 9. Ông đã giành quyền tự chủ cho đất nước khi nhà Đường suy yếu, tự xưng Tiết độ sứ Giao Châu. Hành động của ông mở đầu cho thời kỳ tự chủ của người Việt, chấm dứt giai đoạn Bắc thuộc kéo dài hàng thế kỷ.',
N'Giành quyền tự chủ cho Giao Châu; Mở đầu thời kỳ tự chủ; Đặt nền móng cho độc lập dân tộc.',
N'Hải Dương',
N'Đền thờ Khúc Thừa Dụ, Ninh Giang, Hải Dương',
N'khuc-thua-du.jpg',
N'JH1UaVkFsqo',
7
);
go
INSERT INTO Characters(name,dynasty,dynasty_id,description,biography,achievement,birth_place,historical_site,image,youtube_link,timelineOrder)VALUES(
N'Ngô Quyền',
N'Nhà Ngô',
6,
N'Vị anh hùng dân tộc chấm dứt hơn 1000 năm Bắc thuộc bằng chiến thắng Bạch Đằng năm 938.',
N'Ngô Quyền (898-944) là vị vua sáng lập nhà Ngô và là người đặt nền móng cho nền độc lập tự chủ của dân tộc Việt Nam sau
hơn một nghìn năm Bắc thuộc. Ông sinh tại Đường Lâm, Sơn Tây. Năm 938, trước cuộc xâm lược của quân Nam Hán, Ngô Quyền đã 
cho bố trí trận địa cọc trên sông Bạch Đằng, lợi dụng thủy triều để đánh tan quân địch. Chiến thắng Bạch Đằng năm 938 trở
thành một trong những chiến công vĩ đại nhất trong lịch sử dân tộc. Năm 939, ông lên ngôi vua, đóng đô tại Cổ Loa và xây dựng
chính quyền độc lập đầu tiên của người Việt thời kỳ hậu Bắc thuộc.',
N'Chiến thắng Bạch Đằng năm 938; Chấm dứt hơn 1000 năm Bắc thuộc; Thành lập nhà Ngô; Đặt nền móng cho nền độc lập dân tộc.',
N'Đường Lâm, Sơn Tây, Hà Nội',
N'Khu di tích Bạch Đằng Giang, Hải Phòng',
N'ngo-quyen.jpg',
N'38EYR_8uoiI',
8
);
go


-- =========================
-- DYNASTIES
-- =========================

INSERT INTO Dynasties
(Name, Founder, StartYear, EndYear, Capital, Description, Image)
VALUES
(N'Văn Lang',N'Hùng Vương',-2879,-258,N'Phong Châu',
N'Văn Lang là nhà nước đầu tiên trong lịch sử Việt Nam, được hình thành bởi các bộ lạc Lạc Việt dưới sự cai trị của các vua Hùng. Đây là thời kỳ đặt nền móng cho văn hóa, tín ngưỡng và bản sắc dân tộc Việt Nam, nổi bật với nền văn minh Đông Sơn và nghề trồng lúa nước.',N'van-lang.jpg'),

(N'Nhà Ngô',N'Ngô Quyền',939,965,
N'Cổ Loa',N'Triều đại mở đầu thời kỳ độc lập tự chủ sau chiến thắng Bạch Đằng năm 938, chấm dứt hơn một nghìn năm Bắc thuộc.','ngo.jpg'),

(N'Nhà Đinh',N'Đinh Bộ Lĩnh',968,980,N'Hoa Lư',
N'Thống nhất đất nước sau loạn 12 sứ quân, lập quốc hiệu Đại Cồ Việt và xây dựng chính quyền phong kiến tập quyền đầu tiên.','dinh.jpg'),

(N'Tiền Lê',N'Lê Hoàn',980,1009,N'Hoa Lư',
N'Đánh bại quân Tống xâm lược, củng cố nền độc lập và phát triển kinh tế đất nước.','tienle.jpg'),

(N'Nhà Lý',N'Lý Công Uẩn',1010,1225,N'Thăng Long',
N'Dời đô từ Hoa Lư ra Thăng Long, mở ra thời kỳ phát triển lâu dài về chính trị, kinh tế và văn hóa.','ly.jpg'),

(N'Nhà Trần',N'Trần Thái Tông',1225,1400,N'Thăng Long',
N'Nổi tiếng với ba lần chiến thắng quân Nguyên Mông, xây dựng quốc gia hùng mạnh và ổn định.','tran.jpg'),

(N'Nhà Hồ',N'Hồ Quý Ly',1400,1407,N'Tây Đô',
N'Thực hiện nhiều cải cách về tiền tệ, giáo dục và hành chính nhưng tồn tại ngắn do cuộc xâm lược của nhà Minh.','ho.jpg'),

(N'Hậu Lê',N'Lê Lợi',1428,1789,N'Thăng Long',
N'Được thành lập sau khởi nghĩa Lam Sơn, là triều đại tồn tại lâu nhất trong lịch sử phong kiến Việt Nam.','haule.jpg'),

(N'Nhà Mạc',N'Mạc Đăng Dung',1527,1592,N'Đông Kinh',
N'Triều đại tồn tại song song với nhà Lê trong thời kỳ Nam - Bắc triều đầy biến động.','mac.jpg'),

(N'Tây Sơn',N'Nguyễn Nhạc',1778,1802,N'Phú Xuân',
N'Phong trào khởi nghĩa nông dân lật đổ các tập đoàn phong kiến Trịnh - Nguyễn và đánh bại quân Thanh xâm lược.','tayson.jpg'),

(N'Nhà Nguyễn',N'Gia Long',1802,1945,N'Phú Xuân (Huế)',
N'Triều đại phong kiến cuối cùng của Việt Nam, thống nhất đất nước và để lại nhiều công trình kiến trúc giá trị.','nguyen.jpg');

INSERT INTO dynasty_character (dynasty_id, character_id)
VALUES
(1,1),   -- Hùng Vương -> Văn Lang

(2,2),   -- An Dương Vương -> Âu Lạc

(3,3),   -- Hai Bà Trưng -> Bắc Thuộc
(3,4),   -- Bà Triệu -> Bắc Thuộc
(3,6),   -- Mai Thúc Loan -> Bắc Thuộc

(4,5),   -- Lý Nam Đế -> Tiền Lý

(5,7),   -- Khúc Thừa Dụ -> Tự Chủ

(6,8),   -- Ngô Quyền -> Nhà Ngô

(7,9),   -- Đinh Bộ Lĩnh -> Nhà Đinh

(8,10),  -- Lê Hoàn -> Tiền Lê

(9,11),  -- Lý Công Uẩn -> Nhà Lý
(9,12),  -- Lý Thường Kiệt -> Nhà Lý

(10,13), -- Trần Hưng Đạo -> Nhà Trần

(11,14), -- Hồ Quý Ly -> Nhà Hồ

(12,15), -- Lê Lợi -> Hậu Lê
(12,16), -- Lê Thánh Tông -> Hậu Lê

(13,17), -- Mạc Đăng Dung -> Nhà Mạc

(14,18), -- Nguyễn Nhạc -> Tây Sơn
(14,19), -- Quang Trung -> Tây Sơn

(15,20); -- Gia Long -> Nhà Nguyễn
-- =========================
-- TEST
-- =========================

DELETE FROM Favorite;
go
DELETE FROM Comment;
go
DELETE FROM History;
go
DELETE FROM dynasty_character;
go
DELETE FROM Characters;
go
DELETE FROM Dynasties;
delete from FunFacts

DBCC CHECKIDENT ('Characters', RESEED, 0)
DBCC CHECKIDENT ('Dynasties', RESEED, 0);
select * from Favorite

-- =========================
-- FunFact
-- =========================
INSERT INTO FunFacts(title,content,related_character_id)
VALUES
(N'18 đời Vua Hùng',N'Theo truyền thuyết, nước Văn Lang được cai trị qua 18 đời Vua Hùng, đặt nền móng đầu tiên cho lịch sử dân tộc Việt Nam.',1),
(N'Quốc Tổ dân tộc',N'Các Vua Hùng được tôn kính là Quốc Tổ của người Việt. Hằng năm diễn ra Giỗ Tổ Hùng Vương vào ngày 10 tháng 3 âm lịch.',1),
(N'Kinh đô Phong Châu',N'Kinh đô Văn Lang được đặt tại Phong Châu, thuộc tỉnh Phú Thọ ngày nay.',1),
(N'Nhà nước đầu tiên',N'Văn Lang được xem là nhà nước đầu tiên trong lịch sử Việt Nam, hình thành khoảng thế kỷ VII TCN.',1),
(N'Trống đồng Đông Sơn',N'Thời đại Hùng Vương gắn liền với nền văn hóa Đông Sơn và những chiếc trống đồng nổi tiếng.',1),
(N'Tín ngưỡng Hùng Vương',N'Tín ngưỡng thờ cúng Hùng Vương được UNESCO công nhận là Di sản văn hóa phi vật thể đại diện của nhân loại năm 2012.',1),
(N'Bánh chưng bánh giầy',N'Truyền thuyết Lang Liêu thời Hùng Vương kể về nguồn gốc bánh chưng và bánh giầy.',1),
(N'Con Rồng Cháu Tiên',N'Truyền thuyết Lạc Long Quân và Âu Cơ sinh ra bọc trăm trứng là nguồn gốc của dân tộc Việt.',1);
go
INSERT INTO FunFacts(title,content,related_character_id)
VALUES
(N'Nỏ thần Cổ Loa',N'Theo truyền thuyết, An Dương Vương được thần Kim Quy ban cho móng rùa để chế tạo nỏ thần có thể bắn một phát tiêu diệt nhiều quân địch.',2),
(N'Thành cổ lớn nhất thời cổ đại Việt Nam',N'Thành Cổ Loa có cấu trúc xoáy trôn ốc độc đáo với nhiều vòng thành liên tiếp, thể hiện trình độ xây dựng rất cao của người Việt cổ.',2),
(N'Bi kịch Mỵ Châu - Trọng Thủy',N'Câu chuyện Mỵ Châu và Trọng Thủy trở thành một trong những truyền thuyết nổi tiếng nhất lịch sử Việt Nam.',2),
(N'Người lập nước Âu Lạc',N'An Dương Vương là người thống nhất Âu Việt và Lạc Việt, mở ra thời kỳ Âu Lạc trong lịch sử dân tộc.',2);
go
INSERT INTO FunFacts(title, content, related_character_id)
VALUES
(N'Nữ vương đầu tiên', N'Trưng Trắc được xem là nữ vương đầu tiên trong lịch sử Việt Nam.', 3),
(N'Khởi nghĩa 40 SCN', N'Cuộc khởi nghĩa Hai Bà Trưng bùng nổ vào mùa xuân năm 40 và nhanh chóng giành nhiều thắng lợi.', 3),
(N'Biểu tượng phụ nữ', N'Hai Bà Trưng là biểu tượng cho tinh thần bất khuất của phụ nữ Việt Nam.', 3),
(N'65 thành trì', N'Nghĩa quân đã chiếm lại khoảng 65 thành trì trong thời gian ngắn.', 3);
go
INSERT INTO FunFacts(title, content, related_character_id)
VALUES
(N'Câu nói nổi tiếng', N'Tôi muốn cưỡi cơn gió mạnh, đạp luồng sóng dữ.', 4),
(N'Nữ tướng trẻ tuổi', N'Bà Triệu khởi nghĩa khi mới khoảng 20 tuổi.', 4),
(N'Biểu tượng chống đô hộ', N'Hình ảnh Bà Triệu là biểu tượng mạnh mẽ của tinh thần độc lập.', 4),
(N'Khởi nghĩa năm 248', N'Cuộc khởi nghĩa chống nhà Ngô diễn ra vào năm 248.', 4);
go
INSERT INTO FunFacts(title, content, related_character_id)
VALUES
(N'Nước Vạn Xuân', N'Lý Nam Đế là người sáng lập nước Vạn Xuân vào năm 544.', 5),
(N'Xưng đế sớm nhất', N'Ông là một trong những người đầu tiên xưng đế trong lịch sử Việt Nam.', 5),
(N'Khởi nghĩa lớn', N'Cuộc khởi nghĩa chống nhà Lương diễn ra từ năm 542 và giành nhiều thắng lợi.', 5),
(N'Biểu tượng tự chủ', N'Lý Nam Đế được xem là mở đầu thời kỳ tự chủ lâu dài của dân tộc.', 5);
go
INSERT INTO FunFacts(title, content, related_character_id)
VALUES
(N'Mở đầu tự chủ', N'Khúc Thừa Dụ là người mở đầu thời kỳ tự chủ sau Bắc thuộc.', 6),
(N'Hào trưởng lớn', N'Ông là hào trưởng có uy tín lớn ở vùng Hải Dương.', 6),
(N'Suy yếu nhà Đường', N'Khởi nghĩa diễn ra khi nhà Đường đang suy yếu nghiêm trọng.', 6),
(N'Tiết độ sứ Giao Châu', N'Ông từng tự xưng Tiết độ sứ, nắm quyền cai quản Giao Châu.', 6);
go
INSERT INTO FunFacts(title,content,related_character_id)
VALUES
(N'Chiến thuật thiên tài trên sông Bạch Đằng', N'Ngô Quyền là người đầu tiên trong lịch sử Việt Nam sử dụng trận địa cọc gỗ dưới lòng sông để tiêu diệt hạm đội xâm lược quy mô lớn.',7),
(N'Người kết thúc thời kỳ Bắc thuộc',N'Chiến thắng Bạch Đằng năm 938 đã chấm dứt hơn 1000 năm đô hộ của các triều đại phong kiến phương Bắc đối với dân tộc Việt Nam.',7),
(N'Đóng đô tại Cổ Loa', N'Sau khi lên ngôi năm 939, Ngô Quyền chọn thành Cổ Loa làm kinh đô thay vì xây dựng kinh thành mới.', 7),
(N'Tướng tài được trọng dụng', N'Trước khi trở thành vua, Ngô Quyền là vị tướng tài ba của Dương Đình Nghệ và được giao nhiều trọng trách quân sự quan trọng.', 7),
(N'Được xem là vị vua mở đầu thời đại độc lập',N'Nhiều nhà sử học xem Ngô Quyền là người mở đầu kỷ nguyên độc lập lâu dài của dân tộc Việt Nam sau thời Bắc thuộc.',7),
(N'Chiến thắng thay đổi lịch sử dân tộc',N'Chiến thắng Bạch Đằng của Ngô Quyền được đánh giá là một trong những trận thủy chiến vĩ đại nhất lịch sử Việt Nam.', 7),
(N'Biểu tượng của tinh thần tự chủ', N'Tên tuổi Ngô Quyền gắn liền với ý chí tự chủ và khát vọng độc lập của dân tộc Việt Nam.', 7);
