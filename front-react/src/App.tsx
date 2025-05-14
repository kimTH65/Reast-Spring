import React from 'react';
import './App.css';
import BoardItem from 'components/BoardItem';
import latestBoardListMock from 'mocks/latest-board-list.mock';

function App() {
  return (
    <>
    {latestBoardListMock.map(BoardListItem => <BoardItem boardListItem={BoardListItem} />)}
    </>
  );
}

export default App;
