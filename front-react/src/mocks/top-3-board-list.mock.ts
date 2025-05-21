import { BoardListItem } from "types/interface";

const top3BoardListMock : BoardListItem[] =[
    {
        boardNumber: 1,
        title: "첫 번째 게시글",
        content: "이것은 첫 번째 게시글의 내용입니다.",
        boardTitleImage: "https://i.imgur.com/CzXTtJV.jpg",
        favoriteCount: 10,
        commentCount: 5,
        viewCount: 123,
        writeDatetime: "2025-05-14T10:00:00Z",
        writerNickname: "사용자1",
        writerProfileImage: "https://i.imgur.com/CzXTtJV.jpg",
    },
    {
        boardNumber: 2,
        title: "두 번째 게시글",
        content: "여기에는 두 번째 게시글의 내용이 들어갑니다.",
        boardTitleImage: "https://i.imgur.com/OB0y6MR.jpg",
        favoriteCount: 25,
        commentCount: 8,
        viewCount: 456,
        writeDatetime: "2025-05-13T15:30:00Z",
        writerNickname: "작성자2",
        writerProfileImage: null,
    },
    {
        boardNumber: 3,
        title: "세 번째 게시글",
        content: "세 번째 게시글의 일부 내용입니다.",
        boardTitleImage: null,
        favoriteCount: 5,
        commentCount: 0,
        viewCount: 78,
        writeDatetime: "2025-05-12T08:45:00Z",
        writerNickname: "닉네임3",
        writerProfileImage: null,
    }
];

export default top3BoardListMock;
