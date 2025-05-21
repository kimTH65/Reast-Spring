import React from 'react';
import './App.css';
import BoardItem from 'components/BoardItem';
import latestBoardListMock from 'mocks/latest-board-list.mock';
import top3BoardList from 'mocks/top-3-board-list.mock';
import top3BoardListMock from 'mocks/top-3-board-list.mock';
import Top3Item from 'components/Top3Item';
import CommentItem from 'components/CommentItem';
import commentListMock from 'mocks/comment-list.mock';
import favoriteListMock from 'mocks/favorite-list.mock';
import FavofiteItem from 'components/FavoriteItem';

function App() {
  return (
    <>
    <div style={{display:'flex',columnGap:'30px',rowGap:'20px'}}>
      {favoriteListMock.map(favoriteListItem => <FavofiteItem favoriteListItem={favoriteListItem}/> )}
    </div>
    </>
  );
}

export default App;
