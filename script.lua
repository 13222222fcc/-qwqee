import React, { useState } from "react";
import { Tabs, Button, InputNumber, Switch, Slider, List, message } from "antd";

const { TabPane } = Tabs;

// 假设服务器玩家数据
const playerList = [
  "玩家A", "玩家B", "玩家C", "玩家D"
];

export default function App() {
  const [flySpeed, setFlySpeed] = useState(10);
  const [rotateSpeed, setRotateSpeed] = useState(1000);
  const [moveSpeed, setMoveSpeed] = useState(100);
  const [moveSpeedEnabled, setMoveSpeedEnabled] = useState(false);
  const [jumpEnabled, setJumpEnabled] = useState(false);
  const [jumpHeight, setJumpHeight] = useState(10);
  const [attackBoxVal, setAttackBoxVal] = useState(10);

  // 事件模拟函数
  const fly = () => message.success(`飞行，速度为${flySpeed}`);
  const teleport = name => message.success(`传送到${name}`);
  const exit = () => message.success("帮你退出服务器了，要感谢我😍😍😍");

  return (
    <div style={{ padding: 24, maxWidth: 600, margin: "auto" }}>
      <Tabs defaultActiveKey="1">
        <TabPane tab="公告" key="1">
          <h2>公告</h2>
          <p>第1次做脚本</p>
          <p>不懂</p>
          <p>有什么位置不行叫我</p>
          <p style={{ color: "red" }}>（除了第1个页面不可用，其他都可用）</p>
        </TabPane>
        <TabPane tab="通用" key="2">
          <h2>通用功能</h2>
          <div style={{ marginBottom: 8 }}>
            <Button onClick={fly}>飞行</Button>
            <span style={{ marginLeft: 8 }}>
              调整飞行速度：
              <InputNumber min={1} max={9999} value={flySpeed} onChange={setFlySpeed} />
            </span>
          </div>
          <div style={{ marginBottom: 8 }}>
            <Switch /> 透视（玩家彩色亮光隔墙可见）
          </div>
          <div style={{ marginBottom: 8 }}>
            <Switch /> 自瞄（视角跟随玩家）
          </div>
          <div style={{ marginBottom: 8 }}>
            <List
              header="传送到别的玩家处"
              bordered
              dataSource={playerList}
              renderItem={name => (
                <List.Item>
                  <Button type="link" onClick={() => teleport(name)}>{name}</Button>
                </List.Item>
              )}
            />
          </div>
          <div style={{ marginBottom: 8 }}>
            <Button>旋转</Button>
            <span style={{ marginLeft: 8 }}>
              调整旋转速度：
              <Slider min={1} max={9000} value={rotateSpeed} onChange={setRotateSpeed} style={{ width: 200, display: "inline-block" }} />
              ({rotateSpeed})
            </span>
          </div>
          <div style={{ marginBottom: 8 }}>
            <Switch checked={moveSpeedEnabled} onChange={setMoveSpeedEnabled} /> 开启移动速度
            {moveSpeedEnabled && (
              <>
                <span style={{ marginLeft: 8 }}>
                  调整移动速度：
                  <InputNumber min={1} max={9999999999999} value={moveSpeed} onChange={setMoveSpeed} />
                </span>
              </>
            )}
          </div>
          <div style={{ marginBottom: 8 }}>
            <Switch checked={jumpEnabled} onChange={setJumpEnabled} /> 开启跳跃高度
            {jumpEnabled && (
              <>
                <span style={{ marginLeft: 8 }}>
                  调整跳跃高度：
                  <InputNumber min={1} max={999} value={jumpHeight} onChange={setJumpHeight} />
                </span>
              </>
            )}
          </div>
          <div style={{ marginBottom: 8 }}>
            <Button danger onClick={exit}>退出服务器</Button>
          </div>
        </TabPane>
        <TabPane tab="被遗弃" key="3">
          <h2>被遗弃</h2>
          <div style={{ marginBottom: 8 }}>
            <Button>透视幸存者</Button>
          </div>
          <div style={{ marginBottom: 8 }}>
            <Button>透视杀手</Button>
          </div>
          <div style={{ marginBottom: 8 }}>
            攻击箱调整：
            <InputNumber min={10} max={900} value={attackBoxVal} onChange={setAttackBoxVal} />
          </div>
          <div style={{ marginBottom: 8 }}>
            <Button>攻击箱追踪玩家</Button>
            <p style={{ fontSize: 12, color: "#666" }}>
              如果是杀手，命中箱吸到最近幸存者；如果是幸存者，攻击箱跟随杀手。
            </p>
          </div>
        </TabPane>
      </Tabs>
    </div>
  );
    }
    
