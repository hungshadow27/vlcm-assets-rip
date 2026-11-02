package com.tgame.shell.view.components
{
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class FuqiJingjiResultPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var fc2:FCanvas;
      
      private var bt_bit:Bitmap;
      
      private var line:DisplayObject;
      
      private var ft:FTextArea;
      
      private var xian:Bitmap;
      
      private var Meng_bit:Bitmap;
      
      private var listContainer:Sprite;
      
      private var jingjiResultList:FList;
      
      private var lb1:FLabel;
      
      private var lbNum1:FLabel;
      
      private var lb2:FLabel;
      
      private var lbNum2:FLabel;
      
      private var msFt:FTextArea;
      
      private var shuxingNum:FTextArea;
      
      private var tcJingjiBtn:SecondButton;
      
      private var yellowBit:Sprite;
      
      private var blueBit:Sprite;
      
      public function FuqiJingjiResultPanel()
      {
         var i:int = 0;
         super();
         skin = "panel_btn";
         dragAble = true;
         width = 512;
         height = 300;
         titleText = LanResManager.getLanCommonTextWords("竞技结果");
         this.fc2 = new FCanvas();
         this.fc2.x = 10;
         this.fc2.y = 0;
         this.fc2.width = 492;
         this.fc2.height = 122;
         this.fc2.skin = "box_transparence";
         addChild(this.fc2);
         this.fc2 = new FCanvas();
         this.fc2.x = 10;
         this.fc2.y = 121;
         this.fc2.width = 103;
         this.fc2.height = 103;
         this.fc2.skin = "box_transparence";
         addChild(this.fc2);
         this.fc2 = new FCanvas();
         this.fc2.x = 114;
         this.fc2.y = 121;
         this.fc2.width = 388;
         this.fc2.height = 103;
         this.fc2.skin = "box_transparence";
         addChild(this.fc2);
         this.bt_bit = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
         this.bt_bit.x = 12;
         this.bt_bit.y = 2;
         this.bt_bit.width = 488;
         this.bt_bit.height = 24;
         addChild(this.bt_bit);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 60;
         this.line.y = 4;
         addChild(this.line);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 154;
         this.line.y = 4;
         addChild(this.line);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 221;
         this.line.y = 4;
         addChild(this.line);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 296;
         this.line.y = 4;
         addChild(this.line);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 341;
         this.line.y = 4;
         addChild(this.line);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 423;
         this.line.y = 4;
         addChild(this.line);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 0;
            y = 5;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            htmlText = "      " + LanResManager.getLanCommonTextWords("排名") + "                 " + LanResManager.getLanCommonTextWords("角色名") + "                     " + LanResManager.getLanCommonTextWords("所属队伍") + "          " + LanResManager.getLanCommonTextWords("击碎巨石数") + "     " + LanResManager.getLanCommonTextWords("胜率") + "        " + LanResManager.getLanCommonTextWords("击败玩家数") + "          " + LanResManager.getLanCommonTextWords("被击败次数");
         }
         addChild(this.ft);
         i = 0;
         while(i < 4)
         {
            this.xian = new Bitmap();
            this.xian = StaticValue.getBitmapByClassName("ui.line");
            this.xian.x = 13;
            this.xian.y = (i + 1) * 23 + 26;
            this.xian.width = 492 - 6;
            addChild(this.xian);
            if(i % 2 == 1)
            {
               this.Meng_bit = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
               this.Meng_bit.x = 13;
               this.Meng_bit.y = 23 * i + 26;
               this.Meng_bit.width = 488;
               this.Meng_bit.height = 25;
               addChild(this.Meng_bit);
            }
            i++;
         }
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 13;
            y = 27;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,488,96);
            graphics.endFill();
         }
         this.jingjiResultList = new FList();
         this.jingjiResultList.skin = "list";
         this.jingjiResultList.itemRenderer = new JingjiResultList();
         this.jingjiResultList.listWidth = 488;
         this.listContainer.addChild(this.jingjiResultList);
         this.jingjiResultList.x = 0;
         this.jingjiResultList.y = 0;
         this.lb1 = new FLabel();
         with(this.lb1)
         {
            x = 22 - 8;
            y = 125;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("黄队最终积分");
         }
         addChild(this.lb1);
         this.lb2 = new FLabel();
         with(this.lb2)
         {
            x = 22 - 8;
            y = 189 - 15;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("蓝队最终积分");
         }
         addChild(this.lb2);
         this.msFt = new FTextArea();
         with(this.msFt)
         {
            x = 118;
            y = 125;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.msFt);
         this.shuxingNum = new FTextArea();
         with(this.shuxingNum)
         {
            x = 118 + 20;
            y = 157;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.shuxingNum);
         this.tcJingjiBtn = new SecondButton();
         this.tcJingjiBtn.label = LanResManager.getLanCommonTextWords("退出竞技");
         this.tcJingjiBtn.x = (this.width - this.tcJingjiBtn.width) / 2;
         this.tcJingjiBtn.y = this.height - this.tcJingjiBtn.height - 40;
         addChild(this.tcJingjiBtn);
         this.tcJingjiBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(MainUI.UI_RETURN_FUQIJINGJI_CLICK));
      }
      
      public function setInitialize(param1:Array) : void
      {
         this.jingjiResultList.dataProvider = param1;
      }
      
      public function setTeamJifenNum(param1:int, param2:int) : void
      {
         this.showCount("huang",param1);
         this.showCount("lan",param2);
      }
      
      public function setTeamJiangli(param1:Boolean, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int, param13:int) : void
      {
         if(param1)
         {
            this.msFt.textColor = StaticValue.GREEN;
            this.shuxingNum.textColor = StaticValue.GREEN;
            this.msFt.htmlText = LanResManager.getLanCommonTextWords("恭喜您，您所在的队伍本次竞技胜利") + "<br>" + LanResManager.getLanCommonTextWords("本场您获得侠侣值：") + param11 + LanResManager.getLanCommonTextWords("点,且能够得到竞技奖励：");
         }
         else
         {
            this.msFt.textColor = StaticValue.ORANGE;
            this.shuxingNum.textColor = StaticValue.ORANGE;
            this.msFt.htmlText = LanResManager.getLanCommonTextWords("很遗憾，您所在的队伍本次竞技失败") + "<br>" + LanResManager.getLanCommonTextWords("在竞技收益之外，您额外获得安慰奖：");
         }
         this.shuxingNum.htmlText = LanResManager.getLanCommonTextWords("经验：") + param2 + LanResManager.getLanCommonTextWords("（本场）") + "/" + param3 + LanResManager.getLanCommonTextWords("（今日）") + "/" + param4 + LanResManager.getLanCommonTextWords("（今日上限）") + "<br>" + LanResManager.getLanCommonTextWords("真气：") + param5 + LanResManager.getLanCommonTextWords("（本场）") + "/" + param6 + LanResManager.getLanCommonTextWords("（今日）") + "/" + param7 + LanResManager.getLanCommonTextWords("（今日上限）") + "<br>" + LanResManager.getLanCommonTextWords("侠侣声望：") + param8 + LanResManager.getLanCommonTextWords("（本场）") + "/" + param9 + LanResManager.getLanCommonTextWords("（今日）") + "/" + param10 + LanResManager.getLanCommonTextWords("（今日上限）") + "<br>" + LanResManager.getLanCommonTextWords("侠侣值：") + param11 + LanResManager.getLanCommonTextWords("（本场）") + "/" + param12 + LanResManager.getLanCommonTextWords("（今日）") + "/" + param13 + LanResManager.getLanCommonTextWords("（今日上限）");
      }
      
      private function showCount(param1:String, param2:int) : void
      {
         if(param1 == "huang")
         {
            if(this.yellowBit != null)
            {
               this.yellowBit.parent.removeChild(this.yellowBit);
            }
            this.yellowBit = this.getNumsprite(param2,param1);
            this.yellowBit.x = 15 + 45 - 20;
            this.yellowBit.y = 145 + 7 - 2;
            this.addChild(this.yellowBit);
         }
         else if(param1 == "lan")
         {
            if(this.blueBit != null)
            {
               this.blueBit.parent.removeChild(this.blueBit);
            }
            this.blueBit = this.getNumsprite(param2,param1);
            this.blueBit.x = 15 + 45 - 20;
            this.blueBit.y = 219 - 22 + 2;
            this.addChild(this.blueBit);
         }
      }
      
      private function getNumsprite(param1:int, param2:String) : Sprite
      {
         var _loc6_:Bitmap = null;
         var _loc3_:Sprite = new Sprite();
         var _loc4_:String = param1.toString();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc6_ = StaticValue.getBitmapByClassName("ui.jingjichang." + param2 + "." + _loc4_.charAt(_loc5_));
            _loc3_.addChild(_loc6_);
            _loc6_.x = _loc5_ * _loc6_.width;
            _loc5_++;
         }
         _loc3_.mouseChildren = false;
         _loc3_.mouseEnabled = false;
         return _loc3_;
      }
   }
}

