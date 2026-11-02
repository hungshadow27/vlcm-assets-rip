package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.NewButton;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import gs.TweenMax;
   
   public class WuxiakapaiPanel extends FPanel
   {
      
      public static const UI_WUXIAKAPAI_LIST_CLICK:String = "UI_WUXIAKAPAI_LIST_CLICK";
      
      public static const UI_WUXIAKAPAI_XIANGXI_CLICK:String = "UI_WUXIAKAPAI_XIANGXI_CLICK";
      
      public static const UI_WUXIAKAPAI_WAIXIAN_CLICK:String = "UI_WUXIAKAPAI_WAIXIAN_CLICK";
      
      public static const UI_WUXIAKAPAI_YIJIANDUIHUAN_CLICK:String = "UI_WUXIAKAPAI_YIJIANDUIHUAN_CLICK";
      
      public static const UI_WUXIAKAPAI_DUIHUAN_CLICK:String = "UI_WUXIAKAPAI_DUIHUAN_CLICK";
      
      public static const UI_WUXIAKAPAIXIANGXI_GUANBI_CLICK:String = "UI_WUXIAKAPAIXIANGXI_GUANBI_CLICK";
      
      private var bit:Bitmap;
      
      private var btnContainer:Sprite;
      
      private var rightContainer:Sprite;
      
      private var ftValue1:FTextArea;
      
      private var ftValue2:FTextArea;
      
      private var ft:FTextArea;
      
      private var bg:DisplayObject;
      
      private var btn:FSimpleButton;
      
      private var rightContainer1:Sprite;
      
      private var xiangxi:WuxiakapaiXiangxiPanel;
      
      private var xiangxiMask:Sprite;
      
      private var selectType:int;
      
      private var play:int = -1;
      
      private var swfSpr:Sprite;
      
      private var swfArr:Array = [];
      
      private var fts1:FTextArea;
      
      public function WuxiakapaiPanel()
      {
         super();
         width = 670;
         height = 525;
         dragAble = true;
         showCloseButton = true;
         skin = "panel";
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         titleText = LanResManager.getLanCommonTextWords("武侠卡牌");
         this.init();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var $mask:Sprite;
         this.swfSpr = new Sprite();
         addChild(this.swfSpr);
         this.swfSpr.visible = false;
         this.bit = StaticValue.getBitmapByClassName("ui.char.menu.tiao");
         this.bit.x = 10;
         this.bit.y = 2;
         this.bit.height = 478;
         addChild(this.bit);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuxiakapai/bg1.swf");
         this.bg.x = 90;
         this.bg.y = 2;
         addChild(this.bg);
         this.btnContainer = new Sprite();
         addChild(this.btnContainer);
         this.btnContainer.x = 0;
         this.btnContainer.y = 0;
         this.rightContainer = new Sprite();
         addChild(this.rightContainer);
         this.rightContainer.x = 90;
         this.rightContainer.y = 0;
         this.rightContainer1 = new Sprite();
         this.rightContainer.addChild(this.rightContainer1);
         this.rightContainer1.x = 0;
         this.rightContainer1.y = 21;
         this.ft = new FTextArea();
         this.ft.x = 5;
         this.ft.y = 7;
         this.ft.width = 140;
         this.ft.height = 20;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击卡牌查看卡牌详情") + "</fon>";
         this.rightContainer.addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 5;
         this.ft.y = 385;
         this.ft.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("卡牌总属性") + "</font>";
         this.rightContainer.addChild(this.ft);
         this.ftValue1 = new FTextArea();
         this.ftValue1.x = 5;
         this.ftValue1.y = 405;
         this.ftValue1.wordWrap = true;
         this.ftValue1.width = 160;
         this.ftValue1.height = 70;
         this.ftValue1.textColor = StaticValue.GREEN;
         this.rightContainer.addChild(this.ftValue1);
         this.ftValue2 = new FTextArea();
         this.ftValue2.x = 175;
         this.ftValue2.y = 405;
         this.ftValue2.wordWrap = true;
         this.ftValue2.width = 160;
         this.ftValue2.height = 70;
         this.ftValue2.textColor = StaticValue.GREEN;
         this.rightContainer.addChild(this.ftValue2);
         this.ft = new FTextArea();
         this.ft.x = 430;
         this.ft.y = 390;
         this.ft.wordWrap = true;
         this.ft.width = 140;
         this.ft.height = 70;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击一键兑换将全部卡牌碎片上缴，获得卡牌！") + "</font>";
         this.rightContainer.addChild(this.ft);
         this.btn = new FSimpleButton();
         this.btn.skin = "kapai_yijian_Button";
         this.btn.x = 445;
         this.btn.y = 435;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.rightContainer.addChild(this.btn);
         this.xiangxi = new WuxiakapaiXiangxiPanel();
         this.xiangxi.$parent = this;
         addChild(this.xiangxi);
         this.xiangxi.x = 10;
         this.xiangxi.y = 490;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 0;
         $mask.y = 0;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,675,490);
            endFill();
         }
         this.xiangxi.mask = $mask;
         this.fts1 = new FTextArea();
         this.fts1.x = 395;
         this.fts1.y = 395;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 120;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("辟邪剑谱（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击 68888亿、防御60888亿、血量80888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("辟邪剑谱：拥有岳不群的玩家，攻击时有几率触发辟邪剑谱，持续10秒；") + "<br>" + LanResManager.getLanCommonTextWords("在此状态下，每次攻击都可瞬闪，使自己的攻击速度提升至极限，每次") + "<br>" + LanResManager.getLanCommonTextWords("瞬闪都可闪瞬至对手身后瞬间造成击晕持续10秒，每连的触发都将瞬间") + "<br>" + LanResManager.getLanCommonTextWords("造成对手掉血60%；且状态解除后，自身将触发辟邪总诀，走如影，行如") + "<br>" + LanResManager.getLanCommonTextWords("迅，犹如闪电的速度消失的对手视线中，持续10秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function close(param1:BaseEvent = null) : void
      {
         this.onShowLv(false);
      }
      
      private function typeName(param1:int) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case 1:
               _loc2_ = LanResManager.getLanCommonTextWords("攻击");
               break;
            case 2:
               _loc2_ = LanResManager.getLanCommonTextWords("防御");
               break;
            case 3:
               _loc2_ = LanResManager.getLanCommonTextWords("暴击");
               break;
            case 4:
               _loc2_ = LanResManager.getLanCommonTextWords("闪避");
               break;
            case 5:
               _loc2_ = LanResManager.getLanCommonTextWords("生命");
               break;
            case 6:
               _loc2_ = LanResManager.getLanCommonTextWords("体力");
               break;
            case 7:
               _loc2_ = LanResManager.getLanCommonTextWords("内力");
               break;
            case 49:
               _loc2_ = LanResManager.getLanCommonTextWords("武功层数");
         }
         return _loc2_;
      }
      
      private function onClick(param1:MouseEvent = null) : void
      {
         dispatchEvent(new BaseEvent(UI_WUXIAKAPAI_YIJIANDUIHUAN_CLICK,"",this.selectType));
      }
      
      private function onItemClick(param1:MouseEvent = null) : void
      {
         var _loc5_:NewButton = null;
         var _loc2_:NewButton = param1.target as NewButton;
         var _loc3_:int = this.btnContainer.numChildren;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = this.btnContainer.getChildAt(_loc4_) as NewButton;
            _loc5_.skin = "newButton";
            _loc4_++;
         }
         _loc2_.skin = "selectButton";
         dispatchEvent(new BaseEvent(UI_WUXIAKAPAI_LIST_CLICK,"",param1.target.name));
         this.selectType = int(param1.target.name);
      }
      
      private function onKPClick(param1:MouseEvent = null) : void
      {
         var _loc2_:Array = param1.target.name.split(",");
         dispatchEvent(new BaseEvent(UI_WUXIAKAPAI_WAIXIAN_CLICK,"",_loc2_));
      }
      
      private function onImgClick(param1:MouseEvent = null) : void
      {
         dispatchEvent(new BaseEvent(UI_WUXIAKAPAI_XIANGXI_CLICK,"",param1.target.name));
      }
      
      public function onShowLv(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.xiangxi.y == 490)
            {
               TweenMax.to(this.xiangxi,1,{"y":0});
            }
         }
         else if(this.xiangxi.y == 0)
         {
            TweenMax.to(this.xiangxi,1,{"y":490});
         }
      }
      
      public function setLeft(param1:Array, param2:String) : void
      {
         var _loc3_:int = 0;
         var _loc8_:NewButton = null;
         var _loc9_:Array = null;
         if(this.xiangxi != null)
         {
            this.xiangxi.x = 10;
            this.xiangxi.y = 490;
         }
         while(this.btnContainer.numChildren > 0)
         {
            this.btnContainer.removeChildAt(0);
         }
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc8_ = new NewButton();
            if(_loc3_ == 0)
            {
               _loc8_.skin = "selectButton";
            }
            else
            {
               _loc8_.skin = "newButton";
            }
            _loc8_.name = param1[_loc3_].id;
            _loc8_.x = 11;
            _loc8_.y = 2 + 21 * _loc3_;
            _loc8_.label = param1[_loc3_].name;
            _loc8_.addEventListener(MouseEvent.CLICK,this.onItemClick);
            this.btnContainer.addChild(_loc8_);
            _loc8_.width = 80;
            _loc8_.height = 20;
            _loc3_++;
         }
         this.selectType = param1[0].id;
         if(param2.lastIndexOf(",") == param2.length - 1)
         {
            param2 = param2.substr(0,param2.length - 1);
         }
         var _loc4_:Array = param2.split(",");
         var _loc5_:String = "";
         var _loc6_:String = "";
         var _loc7_:int = _loc4_.length / 2;
         if(_loc4_.length % 2 == 0)
         {
            _loc7_--;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            _loc9_ = _loc4_[_loc3_].split(":");
            if(_loc3_ > _loc7_)
            {
               _loc6_ += this.typeName(_loc9_[0]) + ":" + _loc9_[1] + "<br>";
            }
            else
            {
               _loc5_ += this.typeName(_loc9_[0]) + ":" + _loc9_[1] + "<br>";
            }
            _loc3_++;
         }
         _loc5_ = _loc5_.substr(0,_loc5_.length - 4);
         _loc6_ = _loc6_.substr(0,_loc6_.length - 4);
         if(param2 == "")
         {
            _loc5_ = "";
            _loc6_ = "";
         }
         this.ftValue1.htmlText = _loc5_;
         this.ftValue2.htmlText = _loc6_;
      }
      
      public function setRight(param1:Array, param2:int) : void
      {
         var j:*;
         var k:*;
         var i:int;
         var ico:DisplayObject = null;
         var btns:SecondButton = null;
         var ftName:FTextArea = null;
         var ico1:DisplayObject = null;
         var ico2:DisplayObject = null;
         var obj:Object = null;
         var arr:Array = param1;
         var playerID:int = param2;
         this.play = playerID;
         while(this.rightContainer1.numChildren > 0)
         {
            this.rightContainer1.removeChildAt(0);
         }
         if(this.selectType == 2)
         {
            if(this.play == -1)
            {
               this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.WUXIAKAPAI_BIXIEJIANPU_ID];
            }
            else
            {
               this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXIAKAPAI_BIXIEJIANPU_ID];
            }
         }
         else
         {
            this.fts1.visible = false;
         }
         j = 0;
         k = 0;
         i = 0;
         while(i < arr.length)
         {
            if((i + 1) % 4 == 1 && i != 0)
            {
               j++;
               k = 0;
            }
            ico = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuxiakapai/img/" + arr[i].imgID + "_s.swf");
            ico.x = 22 + 140 * k;
            ico.y = 12 + 172 * j;
            ico.name = arr[i].id;
            this.rightContainer1.addChild(ico);
            ico.addEventListener(MouseEvent.CLICK,this.onImgClick);
            btns = new SecondButton();
            btns.name = arr[i].id + "," + arr[i].state;
            if(arr[i].state == 0)
            {
               btns.label = LanResManager.getLanCommonTextWords("无法激活");
               btns.enabled = false;
            }
            else if(arr[i].state == 1)
            {
               btns.label = LanResManager.getLanCommonTextWords("激活外形");
               if(playerID != -1)
               {
                  btns.enabled = false;
               }
               else
               {
                  btns.enabled = true;
               }
            }
            else
            {
               btns.label = LanResManager.getLanCommonTextWords("隐藏外形");
               if(playerID != -1)
               {
                  btns.enabled = false;
               }
               else
               {
                  btns.enabled = true;
               }
            }
            btns.x = ico.x + 22;
            btns.y = ico.y + 146;
            btns.addEventListener(MouseEvent.CLICK,this.onKPClick);
            this.rightContainer1.addChild(btns);
            if(arr[i].lv == 2)
            {
               ico1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuxiakapai/pure_small.swf");
               ico1.x = 22 + 140 * k;
               ico1.y = 12 + 172 * j;
               ico1.name = arr[i].id;
               this.rightContainer1.addChild(ico1);
               ico1.addEventListener(MouseEvent.CLICK,this.onImgClick);
               ico2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuxiakapai/pure_bgs.swf");
               ico2.x = 20 + 140 * k + 12;
               ico2.y = 12 + 172 * j + 105;
               this.rightContainer1.addChild(ico2);
               ico2.name = arr[i].id;
               ico2.addEventListener(MouseEvent.CLICK,this.onImgClick);
            }
            else if(arr[i].lv == 3)
            {
               ico1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuxiakapai/orange_small.swf");
               ico1.x = 22 + 140 * k;
               ico1.y = 12 + 172 * j;
               ico1.name = arr[i].id;
               ico1.addEventListener(MouseEvent.CLICK,this.onImgClick);
               this.rightContainer1.addChild(ico1);
               ico2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuxiakapai/orange_bgs.swf");
               ico2.x = 20 + 140 * k + 12;
               ico2.y = 12 + 172 * j + 105;
               ico2.name = arr[i].id;
               this.rightContainer1.addChild(ico2);
               ico2.addEventListener(MouseEvent.CLICK,this.onImgClick);
               obj = new Object();
               obj.k = k;
               obj.j = j;
               obj.id = arr[i].id;
               LoadSwf.AndReturnMC2(GameConfig.fileBaseFolder + "res/ui/UIditu/wuxiakapai/texiao.swf",function(param1:MovieClip, param2:Object):*
               {
                  var _loc3_:Sprite = null;
                  if(param1)
                  {
                     _loc3_ = new Sprite();
                     _loc3_.addChild(param1);
                     _loc3_.name = String(param2.id);
                     _loc3_.addEventListener(MouseEvent.CLICK,onImgClick);
                     _loc3_.x = 22 + 140 * param2.k;
                     _loc3_.y = 12 + 172 * param2.j;
                     rightContainer1.addChild(_loc3_);
                  }
               },obj);
            }
            else
            {
               ico2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuxiakapai/green_bgs.swf");
               ico2.x = 20 + 140 * k + 12;
               ico2.y = 12 + 172 * j + 105;
               this.rightContainer1.addChild(ico2);
               ico2.name = arr[i].id;
               ico2.addEventListener(MouseEvent.CLICK,this.onImgClick);
            }
            ftName = new FTextArea();
            ftName.width = 50;
            ftName.height = 24;
            ftName.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + arr[i].name + "</font>";
            ftName.x = 20 + 140 * k + 12 + 44 - ftName.textWidth / 2;
            ftName.y = 15 + 172 * j + 105;
            this.rightContainer1.addChild(ftName);
            ftName.name = arr[i].id;
            ftName.addEventListener(MouseEvent.CLICK,this.onImgClick);
            k++;
            i++;
         }
         if(playerID != -1)
         {
            this.btn.enabled = false;
         }
         else
         {
            this.btn.enabled = true;
         }
      }
      
      public function setXiangxi(param1:int, param2:int, param3:int, param4:int, param5:String, param6:String, param7:String, param8:String, param9:int, param10:int, param11:int) : void
      {
         this.xiangxi.setData(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
   }
}

