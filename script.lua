import React, { useState } from "react";

const NoticePage = () => (
  <div>
    <h2>公告</h2>
    <p>第1次做脚本</p>
    <p>不懂</p>
    <p>有什么位置不行叫我</p>
    <p style={{ color: "red" }}>（除了第1个页面不可用，其他都可用）</p>
  </div>
);

const CommonPage = ({
  flightSpeed,
  setFlightSpeed,
  rotateSpeed,
  setRotateSpeed,
  moveSpeedEnabled,
  setMoveSpeedEnabled,
  moveSpeed,
  setMoveSpeed,
  jumpHeightEnabled,
  setJumpHeightEnabled,
  jumpHeight,
  setJumpHeight,
  players,
  onTeleport,
}) => (
  <div>
    <h2>通用</h2>
    <button onClick={() => alert(`飞行，速度：${flightSpeed}`)}>飞行</button>
    <div>
      <label>调整飞行速度</label>
      <input
        type="number"
        min={1}
        max={9999}
        value={flightSpeed}
        onChange={e => setFlightSpeed(Number(e.target.value))}
      />
    </div>
    <button onClick={() => alert("透视已开启")}>透视（玩家彩色亮光隔墙可见）</button>
    <button onClick={() => alert("自瞄已开启")}>自瞄（视角跟随玩家）</button>
    <div>
      <label>传送到别的玩家处:</label>
      {players.map(player => (
        <button key={player} onClick={() => onTeleport(player)}>
          {player}
        </button>
      ))}
    </div>
    <button onClick={() => alert(`旋转，速度：${rotateSpeed}`)}>旋转</button>
    <div>
      <label>调整旋转速度</label>
      <input
        type="number"
        min={1}
        max={9000}
        value={rotateSpeed}
        onChange={e => setRotateSpeed(Number(e.target.value))}
      />
    </div>
    <div>
      <label>
        <input
          type="checkbox"
          checked={moveSpeedEnabled}
          onChange={e => setMoveSpeedEnabled(e.target.checked)}
        />
        开启移动速度
      </label>
      {moveSpeedEnabled && (
        <input
          type="number"
          min={1}
          max={9999999999999}
          value={moveSpeed}
          onChange={e => setMoveSpeed(Number(e.target.value))}
        />
      )}
    </div>
    <div>
      <label>
        <input
          type="checkbox"
          checked={jumpHeightEnabled}
          onChange={e => setJumpHeightEnabled(e.target.checked)}
        />
        开启跳跃高度
      </label>
      {jumpHeightEnabled && (
        <input
          type="number"
          min={1}
          max={999}
          value={jumpHeight}
          onChange={e => setJumpHeight(Number(e.target.value))}
        />
      )}
    </div>
    <button
      onClick={() =>
        alert("帮你退出服务器了，要感谢我😍😍😍")
      }
    >
      退出服务器
    </button>
  </div>
);

const DiscardedPage = ({
  survivorESP,
  setSurvivorESP,
  killerESP,
  setKillerESP,
  attackBox,
  setAttackBox,
  boxTracking,
  setBoxTracking,
}) => (
  <div>
    <h2>被遗弃</h2>
    <button onClick={() => setSurvivorESP(v => !v)}>
      {survivorESP ? "关闭" : "开启"}透视幸存者
    </button>
    <button onClick={() => setKillerESP(v => !v)}>
      {killerESP ? "关闭" : "开启"}透视杀手
    </button>
    <div>
      <label>攻击箱调整</label>
      <input
        type="number"
        min={10}
        max={900}
        value={attackBox}
        onChange={e => setAttackBox(Number(e.target.value))}
      />
    </div>
    <button onClick={() => setBoxTracking(v => !v)}>
      {boxTracking ? "关闭" : "开启"}攻击箱追踪玩家
    </button>
  </div>
);

export default function GameUI() {
  const [page, setPage] = useState(0);

  // 通用页的状态
  const [flightSpeed, setFlightSpeed] = useState(1);
  const [rotateSpeed, setRotateSpeed] = useState(1);
  const [moveSpeedEnabled, setMoveSpeedEnabled] = useState(false);
  const [moveSpeed, setMoveSpeed] = useState(1);
  const [jumpHeightEnabled, setJumpHeightEnabled] = useState(false);
  const [jumpHeight, setJumpHeight] = useState(1);
  const [players] = useState(["玩家A", "玩家B", "玩家C"]);
  const onTeleport = player => alert(`已传送到${player}`);

  // 被遗弃页的状态
  const [survivorESP, setSurvivorESP] = useState(false);
  const [killerESP, setKillerESP] = useState(false);
  const [attackBox, setAttackBox] = useState(10);
  const [boxTracking, setBoxTracking] = useState(false);

  return (
    <div>
      <nav>
        <button onClick={() => setPage(0)}>公告</button>
        <button onClick={() => setPage(1)}>通用</button>
        <button onClick={() => setPage(2)}>被遗弃</button>
      </nav>
      <div style={{ border: "1px solid #ccc", padding: 20, marginTop: 10 }}>
        {page === 0 && <NoticePage />}
        {page === 1 && (
          <CommonPage
            flightSpeed={flightSpeed}
            setFlightSpeed={setFlightSpeed}
            rotateSpeed={rotateSpeed}
            setRotateSpeed={setRotateSpeed}
            moveSpeedEnabled={moveSpeedEnabled}
            setMoveSpeedEnabled={setMoveSpeedEnabled}
            moveSpeed={moveSpeed}
            setMoveSpeed={setMoveSpeed}
            jumpHeightEnabled={jumpHeightEnabled}
            setJumpHeightEnabled={setJumpHeightEnabled}
            jumpHeight={jumpHeight}
            setJumpHeight={setJumpHeight}
            players={players}
            onTeleport={onTeleport}
          />
        )}
        {page === 2 && (
          <DiscardedPage
            survivorESP={survivorESP}
            setSurvivorESP={setSurvivorESP}
            killerESP={killerESP}
            setKillerESP={setKillerESP}
            attackBox={attackBox}
            setAttackBox={setAttackBox}
            boxTracking={boxTracking}
            setBoxTracking={setBoxTracking}
          />
        )}
      </div>
    </div>
  );
  }
