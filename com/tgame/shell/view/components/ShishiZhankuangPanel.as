package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.monster.MonsterRes;
   import com.tgame.common.res.monster.MonsterResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.shishiZhankuang.ShishiZhankuangList;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class ShishiZhankuangPanel extends FPanel
   {
      
      private var ft:FTextArea;
      
      private var jifen1:FTextArea;
      
      private var jifen2:FTextArea;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var Scroll:FVScorllBar;
      
      private var canzhan1:FTextArea;
      
      private var canzhan2:FTextArea;
      
      private var tipCanvas:FCanvas;
      
      private var bx:FCanvas;
      
      private var bt_bit:Bitmap;
      
      private var line:DisplayObject;
      
      public var redBar1:ColorBar;
      
      public var redBar2:ColorBar;
      
      private var headContainer:Sprite;
      
      private var staArr:Array;
      
      private var containerArr:Array;
      
      private var tip:FTextArea;
      
      private var bossBg:DisplayObject;
      
      private var weiChuzhan1:DisplayObject;
      
      private var weiChuzhan2:DisplayObject;
      
      public function ShishiZhankuangPanel()
      {
         var bg:Bitmap;
         var i:int;
         var img:Bitmap = null;
         var fl:FLabel = null;
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 532 + 20;
         height = 555;
         titleText = LanResManager.getLanCommonTextWords("实时战况");
         this.bossBg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/1.jpg",532,260);
         this.bossBg.x = 10;
         this.bossBg.y = 2;
         addChild(this.bossBg);
         this.weiChuzhan1 = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/3.png",117,92);
         this.weiChuzhan1.x = 30;
         this.weiChuzhan1.y = 60;
         addChild(this.weiChuzhan1);
         this.weiChuzhan2 = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/3.png",117,92);
         this.weiChuzhan2.x = 405;
         this.weiChuzhan2.y = 60;
         addChild(this.weiChuzhan2);
         this.ft = new FTextArea();
         this.ft.filters = StaticValue.filter;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.x = 200;
         this.ft.y = 150;
         this.ft.textColor = StaticValue.BLUE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("大宋");
         addChild(this.ft);
         this.jifen1 = new FTextArea();
         this.jifen1.filters = StaticValue.filter;
         this.jifen1.autoSize = TextFieldAutoSize.LEFT;
         this.jifen1.x = 180;
         this.jifen1.y = 180;
         this.jifen1.textColor = StaticValue.BLUE;
         this.jifen1.htmlText = LanResManager.getLanCommonTextWords("总积分");
         addChild(this.jifen1);
         this.ft = new FTextArea();
         this.ft.filters = StaticValue.filter;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.x = 315 - 5;
         this.ft.y = 150;
         this.ft.textColor = StaticValue.GREEN;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("蒙古");
         addChild(this.ft);
         this.jifen2 = new FTextArea();
         this.jifen2.filters = StaticValue.filter;
         this.jifen2.autoSize = TextFieldAutoSize.LEFT;
         this.jifen2.x = 300 - 5;
         this.jifen2.y = 180;
         this.jifen2.textColor = StaticValue.GREEN;
         this.jifen2.htmlText = LanResManager.getLanCommonTextWords("总积分");
         addChild(this.jifen2);
         this.bt_bit = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
         this.bt_bit.x = 10;
         this.bt_bit.y = 262;
         this.bt_bit.width = 532;
         this.bt_bit.height = 24;
         addChild(this.bt_bit);
         this.ft = new FTextArea();
         this.ft.multiline = true;
         this.ft.filters = StaticValue.filter;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.x = 50;
         this.ft.y = 265;
         this.ft.textColor = StaticValue.ORANGE;
         this.ft.text = LanResManager.getLanCommonTextWords("姓名") + "                          " + LanResManager.getLanCommonTextWords("击杀敌方玩家次数") + "              " + LanResManager.getLanCommonTextWords("击杀敌方军队数量积分当前状态");
         addChild(this.ft);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 130;
         this.line.y = 262;
         addChild(this.line);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 255;
         this.line.y = 262;
         addChild(this.line);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 385;
         this.line.y = 262;
         addChild(this.line);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 450;
         this.line.y = 262;
         addChild(this.line);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 10;
            y = 285;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,530,205);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new ShishiZhankuangList();
         this.giftList.listWidth = 515;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.Scroll = new FVScorllBar(this.listContainer,205);
         addChild(this.Scroll);
         this.Scroll.height = 205;
         this.Scroll.x = 525;
         this.Scroll.y = 285;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bt_bit = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
         this.bt_bit.x = 10;
         this.bt_bit.y = 490;
         this.bt_bit.width = 532;
         this.bt_bit.height = 24;
         addChild(this.bt_bit);
         this.canzhan1 = new FTextArea();
         this.canzhan1.multiline = true;
         this.canzhan1.filters = StaticValue.filter;
         this.canzhan1.autoSize = TextFieldAutoSize.LEFT;
         this.canzhan1.x = 100;
         this.canzhan1.y = 490;
         this.canzhan1.textColor = StaticValue.BLUE;
         this.canzhan1.htmlText = LanResManager.getLanCommonTextWords("大宋参战人数：");
         addChild(this.canzhan1);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = width / 2 + 2;
         this.line.y = 490;
         addChild(this.line);
         this.canzhan2 = new FTextArea();
         this.canzhan2.multiline = true;
         this.canzhan2.filters = StaticValue.filter;
         this.canzhan2.autoSize = TextFieldAutoSize.LEFT;
         this.canzhan2.x = 350;
         this.canzhan2.y = 490;
         this.canzhan2.textColor = StaticValue.GREEN;
         this.canzhan2.htmlText = LanResManager.getLanCommonTextWords("蒙古参战人数：");
         addChild(this.canzhan2);
         bg = StaticValue.getBitmapByClassName("ui.char.attribute.colorBar.bg");
         addChild(bg);
         bg.x = 37;
         bg.y = 20;
         this.redBar1 = new ColorBar(1,101,5,true,true,true,"<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前血量"),"<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("最大血量"));
         this.redBar1.x = 41;
         this.redBar1.y = 23;
         this.redBar1.setValue(80,100);
         addChild(this.redBar1);
         bg = StaticValue.getBitmapByClassName("ui.char.attribute.colorBar.bg");
         addChild(bg);
         bg.x = 407;
         bg.y = 20;
         this.redBar2 = new ColorBar(1,101,5,true,true,true,"<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前血量"),"<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("最大血量"));
         addChild(this.redBar2);
         this.redBar2.setValue(100,100);
         this.redBar2.x = 411;
         this.redBar2.y = 23;
         this.containerArr = new Array();
         i = 0;
         while(i < 6)
         {
            this.headContainer = new Sprite();
            fl = new FLabel();
            this.headContainer.y = 218;
            fl.y = 10;
            fl.textColor = 5534321;
            if(i == 0)
            {
               this.headContainer.name = LanResManager.getLanCommonTextWords("左先锋");
               this.headContainer.x = 30;
            }
            else if(i == 1)
            {
               this.headContainer.name = LanResManager.getLanCommonTextWords("中先锋");
               this.headContainer.x = 90;
            }
            else if(i == 2)
            {
               this.headContainer.name = LanResManager.getLanCommonTextWords("右先锋");
               this.headContainer.x = 150;
            }
            else if(i == 3)
            {
               this.headContainer.name = LanResManager.getLanCommonTextWords("左统领");
               this.headContainer.x = 370;
            }
            else if(i == 4)
            {
               this.headContainer.name = LanResManager.getLanCommonTextWords("中统领");
               this.headContainer.x = 430;
            }
            else if(i == 5)
            {
               this.headContainer.name = LanResManager.getLanCommonTextWords("右统领");
               this.headContainer.x = 490;
            }
            img = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.headContainer.addChild(img);
            this.headContainer.addChild(fl);
            addChild(this.headContainer);
            this.containerArr.push(this.headContainer);
            i++;
         }
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         this.staArr = new Array();
         this.staArr.push(0,0,0,0,0,0);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setData(param1:Array) : void
      {
         this.giftList.dataProvider = param1;
         if(param1.length > 8)
         {
            this.Scroll.update();
            this.Scroll.visible = true;
         }
         else
         {
            this.Scroll.visible = false;
         }
      }
      
      public function setRenshu(param1:int, param2:int) : void
      {
         this.canzhan1.htmlText = LanResManager.getLanCommonTextWords("大宋参战人数：") + param1;
         this.canzhan2.htmlText = LanResManager.getLanCommonTextWords("蒙古参战人数：") + param2;
      }
      
      public function setJifen(param1:int, param2:int) : void
      {
         this.jifen1.htmlText = LanResManager.getLanCommonTextWords("总积分") + "" + param1;
         this.jifen2.htmlText = LanResManager.getLanCommonTextWords("总积分") + "" + param2;
      }
      
      public function setBossHP(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         this.redBar1.setValue(param1,param2);
         this.redBar2.setValue(param3,param4);
      }
      
      public function setBossSta(param1:int, param2:int) : void
      {
         if(param1 == 0)
         {
            this.weiChuzhan1.visible = true;
         }
         else
         {
            this.weiChuzhan1.visible = false;
         }
         if(param2 == 0)
         {
            this.weiChuzhan2.visible = true;
         }
         else
         {
            this.weiChuzhan2.visible = false;
         }
      }
      
      public function setQianfenSta(param1:Array) : void
      {
         var _loc5_:Bitmap = null;
         var _loc6_:DisplayObject = null;
         this.staArr = param1;
         var _loc2_:MonsterRes = MonsterResManager.getMonsterRes(42006);
         var _loc3_:MonsterRes = MonsterResManager.getMonsterRes(42002);
         var _loc4_:int = 0;
         while(_loc4_ < 6)
         {
            if(this.containerArr[_loc4_].getChildByName("head"))
            {
               this.containerArr[_loc4_].removeChild(this.containerArr[_loc4_].getChildByName("head"));
            }
            if(this.containerArr[_loc4_].getChildByName(LanResManager.getLanCommonTextWords("已阵亡")))
            {
               this.containerArr[_loc4_].removeChild(this.containerArr[_loc4_].getChildByName(LanResManager.getLanCommonTextWords("已阵亡")));
            }
            if(this.containerArr[_loc4_].hasEventListener(MouseEvent.MOUSE_OVER))
            {
               this.containerArr[_loc4_].removeEventListener(MouseEvent.MOUSE_OVER,this.onHeadMouse);
               this.containerArr[_loc4_].removeEventListener(MouseEvent.MOUSE_OUT,this.onHeadMouse);
            }
            if(this.staArr[_loc4_] == 1)
            {
               this.containerArr[_loc4_].addEventListener(MouseEvent.MOUSE_OVER,this.onHeadMouse);
               this.containerArr[_loc4_].addEventListener(MouseEvent.MOUSE_OUT,this.onHeadMouse);
               if(_loc4_ < 3)
               {
                  _loc5_ = ResPathManager.getSmallICO(_loc2_.id_ico,35,35);
               }
               else
               {
                  _loc5_ = ResPathManager.getSmallICO(_loc3_.id_ico,35,35);
               }
               _loc5_.name = "head";
               _loc5_.x = 2;
               _loc5_.y = 2;
               this.containerArr[_loc4_].addChild(_loc5_);
            }
            else if(this.staArr[_loc4_] == 2)
            {
               this.containerArr[_loc4_].addEventListener(MouseEvent.MOUSE_OVER,this.onHeadMouse);
               this.containerArr[_loc4_].addEventListener(MouseEvent.MOUSE_OUT,this.onHeadMouse);
               if(_loc4_ < 3)
               {
                  _loc5_ = ResPathManager.getSmallICO(_loc2_.id_ico,35,35);
                  _loc5_.filters = Tools.darkFilter;
               }
               else
               {
                  _loc5_ = ResPathManager.getSmallICO(_loc3_.id_ico,35,35);
                  _loc5_.filters = Tools.darkFilter;
               }
               _loc5_.name = "head";
               _loc5_.x = 2;
               _loc5_.y = 2;
               this.containerArr[_loc4_].addChild(_loc5_);
               _loc6_ = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/4.png",34,29);
               _loc6_.name = LanResManager.getLanCommonTextWords("已阵亡");
               _loc6_.x = 2;
               _loc6_.y = 3;
               this.containerArr[_loc4_].addChild(_loc6_);
            }
            _loc4_++;
         }
      }
      
      private function onHeadMouse(param1:MouseEvent) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               _loc2_ = param1.currentTarget as Sprite;
               _loc3_ = new String();
               switch(_loc2_.name)
               {
                  case LanResManager.getLanCommonTextWords("左先锋"):
                     _loc3_ = this.staArr[0] == 1 ? LanResManager.getLanCommonTextWords("已出战") : LanResManager.getLanCommonTextWords("已阵亡");
                     break;
                  case LanResManager.getLanCommonTextWords("中先锋"):
                     _loc3_ = this.staArr[1] == 1 ? LanResManager.getLanCommonTextWords("已出战") : LanResManager.getLanCommonTextWords("已阵亡");
                     break;
                  case LanResManager.getLanCommonTextWords("右先锋"):
                     _loc3_ = this.staArr[2] == 1 ? LanResManager.getLanCommonTextWords("已出战") : LanResManager.getLanCommonTextWords("已阵亡");
                     break;
                  case LanResManager.getLanCommonTextWords("左统领"):
                     _loc3_ = this.staArr[3] == 1 ? LanResManager.getLanCommonTextWords("已出战") : LanResManager.getLanCommonTextWords("已阵亡");
                     break;
                  case LanResManager.getLanCommonTextWords("中统领"):
                     _loc3_ = this.staArr[4] == 1 ? LanResManager.getLanCommonTextWords("已出战") : LanResManager.getLanCommonTextWords("已阵亡");
                     break;
                  case LanResManager.getLanCommonTextWords("右统领"):
                     _loc3_ = this.staArr[5] == 1 ? LanResManager.getLanCommonTextWords("已出战") : LanResManager.getLanCommonTextWords("已阵亡");
                     break;
                  default:
                     return;
               }
               this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + (_loc3_ == LanResManager.getLanCommonTextWords("已出战") ? StaticValue.GREEN_HTML : StaticValue.RED_HTML) + "\'>" + _loc2_.name + _loc3_ + "<br>" + "</textformat>";
               Tools.currentStage.addChild(this.tipCanvas);
               this.tipCanvas.width = this.tip.width + 4;
               this.tipCanvas.height = this.tip.height + 4;
               this.tipCanvas.x = Tools.currentStage.mouseX + 15;
               this.tipCanvas.y = Tools.currentStage.mouseY + 25;
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
         }
      }
   }
}

