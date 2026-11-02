package com.tgame.shell.view.components.attribute
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class FuWenKeHua extends Sprite
   {
      
      public static const UI_FUWENDATA_GUANBI_CLICK:String = "UI_FUWENDATA_GUANBI_CLICK";
      
      private var bg:DisplayObject;
      
      private var upButton:FSimpleButton;
      
      private var downButton:FSimpleButton;
      
      private var yeHaoFta:FTextArea;
      
      private var upVButton:SmallButton;
      
      private var downVButton:SmallButton;
      
      private var shuxing:FTextArea;
      
      private var shuoMing:FTextArea;
      
      private var _$parent:DisplayObject;
      
      public const CANHEZHI_MAX:int = 7;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var kuang:Bitmap;
      
      private var jinengSpr:Sprite;
      
      private var tf:TextFormat;
      
      private var equipContainers:Sprite;
      
      private var isMain:Boolean;
      
      private var fujia:FTextArea;
      
      private var kuangHD:Bitmap;
      
      private var kuangSpr:Sprite;
      
      private var goodsSpr:Sprite;
      
      private var now:int;
      
      private var fuWenPanel:FuWenDataPanel;
      
      public var goodsArr:Array;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var testBtn:SmallButton;
      
      private var mcSpr:Sprite;
      
      private var mc2Arr:Array;
      
      private var mc3Arr:Array;
      
      private var noMc2Index:Array;
      
      private var noMc3Index:Array;
      
      private var quanSpr:Sprite;
      
      private var longSpr:Sprite;
      
      private var longMc:MovieClip;
      
      private var lvCount:int;
      
      private var ziCount:int;
      
      private var chengCount:int;
      
      private var helpBtn:FSimpleButton;
      
      private var maxPage:int;
      
      public function FuWenKeHua()
      {
         var $mask:Sprite;
         var title:FTextArea = null;
         this.mc2Arr = [];
         this.mc3Arr = [];
         this.noMc2Index = [];
         this.noMc3Index = [];
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/fuWenKeHua/bg.swf");
         this.bg.x = 0;
         this.bg.y = 2;
         addChild(this.bg);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         title = new FTextArea();
         title.multiline = true;
         title.filters = StaticValue.filter;
         title.width = 100;
         title.height = 110;
         title.x = 170;
         title.y = 10;
         title.textColor = StaticValue.ORANGE;
         title.htmlText = "<textformat leading=\'50\'><font size = \'16\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("符文刻画") + "</font></textformat>";
         addChild(title);
         this.upButton = new FSimpleButton();
         this.upButton.skin = "previousButton";
         addChild(this.upButton);
         this.upButton.x = 240 + 50 - 45 - 16 - 116 + 37;
         this.upButton.y = 205 + 25 - 20 + 25 - 18 - 3 + 130;
         this.upButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.upVButton = new SmallButton();
         this.upVButton.label = "首页";
         this.upVButton.x = 240 + 50 - 45 - 16 - 130;
         this.upVButton.y = 205 + 25 - 20 + 25 - 18 - 3 + 130;
         this.upVButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.yeHaoFta = new FTextArea();
         this.yeHaoFta.autoSize;
         addChild(this.yeHaoFta);
         this.yeHaoFta.defaultTextFormat = this.tf;
         this.yeHaoFta.background = true;
         this.yeHaoFta.backgroundColor = 1186072;
         this.yeHaoFta.width = 59;
         this.yeHaoFta.height = 17;
         this.yeHaoFta.x = 170;
         this.yeHaoFta.y = 230 - 20 + 25 - 18 - 3 + 130;
         this.downButton = new FSimpleButton();
         this.downButton.skin = "nextButton";
         addChild(this.downButton);
         this.downButton.x = 240 + 50 - 45 - 16;
         this.downButton.y = 205 + 25 - 20 + 25 - 18 - 3 + 130;
         this.downButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.downVButton = new SmallButton();
         this.downVButton.label = "尾页";
         this.downVButton.x = 240 + 50 - 45 - 16 + 37;
         this.downVButton.y = 205 + 25 - 20 + 25 - 18 - 3 + 130;
         this.downVButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.quanSpr = new Sprite();
         this.quanSpr.mouseChildren = false;
         this.quanSpr.mouseEnabled = false;
         addChild(this.quanSpr);
         this.longSpr = new Sprite();
         this.longSpr.x = 115;
         this.longSpr.y = 90;
         addChild(this.longSpr);
         ToolTips.createToolTips(this.longSpr,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "<font color=\'" + (lvCount >= 8 ? StaticValue.GREEN_HTML : StaticValue.HUISE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("符文之语：集齐8个绿色符文可激活，攻击时有几率触发立即回复自身50%血量。") + "<br>" + "<font color=\'" + (ziCount >= 8 ? StaticValue.GREEN_HTML : StaticValue.HUISE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("符文之力：集齐8个紫色符文可激活，攻击时有几率立即减少对方血量50%") + "<br>" + "<font color=\'" + (chengCount >= 8 ? StaticValue.GREEN_HTML : StaticValue.HUISE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("符文守护：集齐8个橙色符文可激活，攻击时有几率触发符文守护无敌10秒。") + "<br>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("已收集") + (lvCount + ziCount + chengCount) + LanResManager.getLanCommonTextWords("个符文，总共可提升玩家全属性加成") + (lvCount + ziCount + chengCount) * 10 + "%。（" + LanResManager.getLanCommonTextWords("包括攻防血爆闪") + "）";
            return _loc1_ + "</font></textformat>";
         });
         this.goodsSpr = new Sprite();
         addChild(this.goodsSpr);
         this.mcSpr = new Sprite();
         this.mcSpr.mouseChildren = false;
         this.mcSpr.mouseEnabled = false;
         this.goodsSpr.addChild(this.mcSpr);
         addChild(this.downVButton);
         addChild(this.upVButton);
         this.helpBtn = new FSimpleButton();
         this.helpBtn.skin = "helpBtn";
         addChild(this.helpBtn);
         this.helpBtn.x = 360;
         this.helpBtn.y = 10;
         this.helpBtn.toolTip = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("绿色符文只有属性加成。") + "<br>" + LanResManager.getLanCommonTextWords("紫色符文拥有属性加成和技能。") + "<br>" + LanResManager.getLanCommonTextWords("橙色符文拥有属性和技能加成的同时还有特殊的外观显示。") + "<br>" + LanResManager.getLanCommonTextWords("集齐特定的符文数量可激活符文刻画隐藏属性。") + "<br>";
         this.shuxing = new FTextArea();
         addChild(this.shuxing);
         this.shuxing.multiline = true;
         this.shuxing.autoSize = TextFieldAutoSize.LEFT;
         this.shuxing.wordWrap = true;
         this.shuxing.width = 230 - 12 - 20;
         this.shuxing.x = 23 + 300;
         this.shuxing.y = 288 + 7 - 21 + 5;
         this.shuxing.htmlText = "";
         this.fuWenPanel = new FuWenDataPanel();
         this.fuWenPanel.visible = false;
         addChild(this.fuWenPanel);
         this.fuWenPanel.x = 410;
         this.fuWenPanel.y = 0;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = -5;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,500,390);
            endFill();
         }
         this.fuWenPanel.mask = $mask;
         addEventListener(UI_FUWENDATA_GUANBI_CLICK,this.onCloseTupo);
         this.mcObj = new Array();
         this.goodsArr = [];
      }
      
      private function onCloseTupo(param1:BaseEvent) : void
      {
         this.showDataPanel(false);
      }
      
      public function showDataPanel(param1:Boolean) : void
      {
         this.fuWenPanel.visible = param1;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         this.showDataPanel(false);
         switch(param1.target)
         {
            case this.upButton:
               if(this.isMain)
               {
                  this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_FUWENKEHUA_PAGE_CLICK,"",this.now - 1));
               }
               else
               {
                  this._$parent.dispatchEvent(new BaseEvent(TargetAttribute.UI_FUWENKEHUA_PAGE_CLICK,"",this.now - 1));
               }
               break;
            case this.upVButton:
               if(this.isMain)
               {
                  this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_FUWENKEHUA_PAGE_CLICK,"",1));
               }
               else
               {
                  this._$parent.dispatchEvent(new BaseEvent(TargetAttribute.UI_FUWENKEHUA_PAGE_CLICK,"",1));
               }
               break;
            case this.downButton:
               if(this.isMain)
               {
                  this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_FUWENKEHUA_PAGE_CLICK,"",this.now + 1));
               }
               else
               {
                  this._$parent.dispatchEvent(new BaseEvent(TargetAttribute.UI_FUWENKEHUA_PAGE_CLICK,"",this.now + 1));
               }
               break;
            case this.downVButton:
               if(this.isMain)
               {
                  this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_FUWENKEHUA_PAGE_CLICK,"",this.maxPage));
               }
               else
               {
                  this._$parent.dispatchEvent(new BaseEvent(TargetAttribute.UI_FUWENKEHUA_PAGE_CLICK,"",this.maxPage));
               }
               break;
            case this.testBtn:
               this.setJiHuoMc(8,8,8);
               this.setGoods(this.goodsArr);
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.fuWenPanel._$parent = this;
         this.fuWenPanel._parent2 = param1;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:int, param3:int, param4:Array, param5:int, param6:int, param7:int) : void
      {
         this.isMain = param1;
         this.setJiHuoMc(param5,param6,param7);
         this.setGoods(param4);
         this.setPage(param2,param3);
         this.maxPage = param3;
      }
      
      public function setJiHuoMc(param1:int, param2:int, param3:int) : void
      {
         var bg:DisplayObject = null;
         var lvCount:int = param1;
         var ziCount:int = param2;
         var chengCount:int = param3;
         this.chengCount = chengCount;
         this.ziCount = ziCount;
         this.lvCount = lvCount;
         while(this.quanSpr.numChildren != 0)
         {
            this.quanSpr.removeChildAt(0);
         }
         if(lvCount >= 8)
         {
            bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/fuWenKeHua/quanLiang.swf");
         }
         else
         {
            bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/fuWenKeHua/quanAn.swf");
         }
         bg.x = 92;
         bg.y = 81;
         this.quanSpr.addChild(bg);
         if(ziCount >= 8)
         {
            bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/fuWenKeHua/qiuLiang.swf");
         }
         else
         {
            bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/fuWenKeHua/qiuAn.swf");
         }
         bg.x = 92 - 18;
         bg.y = 81 - 15;
         this.quanSpr.addChild(bg);
         while(this.longSpr.numChildren != 0)
         {
            this.longSpr.removeChildAt(0);
         }
         if(chengCount >= 8)
         {
            if(this.longMc != null)
            {
               this.longSpr.addChild(this.longMc);
            }
            else
            {
               LoadSwf.AndReturnMC(GameConfig.fileBaseFolder + "res/ui/UIditu/fuWenKeHua/longLiang.swf",function(param1:MovieClip):*
               {
                  if(param1)
                  {
                     longMc = param1;
                     param1.play();
                     longSpr.addChild(param1);
                  }
               });
            }
         }
         else
         {
            bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/fuWenKeHua/longAn.swf");
            bg.x = 55;
            bg.y = 40;
            this.longSpr.addChild(bg);
         }
      }
      
      public function setFuWenData(param1:Boolean, param2:int, param3:int, param4:String, param5:String, param6:int, param7:Boolean, param8:Boolean, param9:int = 0, param10:int = 0) : void
      {
         this.showDataPanel(true);
         this.fuWenPanel.setFuWenData(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
      }
      
      private function setGoods(param1:Array) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Goods = null;
         var _loc5_:ItemFace = null;
         while(this.goodsSpr.numChildren != 0)
         {
            this.goodsSpr.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = this.getXY(_loc2_);
            _loc4_ = new Goods(param1[_loc2_].id);
            param1[_loc2_].name = _loc4_.res.name;
            _loc5_ = new ItemFace(_loc4_);
            _loc5_.x = _loc3_[0] + 24;
            _loc5_.y = _loc3_[1] + 23;
            _loc5_.removeListener();
            _loc5_.name = "" + _loc2_;
            _loc5_.addEventListener(MouseEvent.MOUSE_OVER,this.onFuWenTips);
            _loc5_.addEventListener(MouseEvent.MOUSE_OUT,this.onFuWenTips);
            _loc5_.addEventListener(MouseEvent.CLICK,this.onItemClick);
            this.goodsSpr.addChild(_loc5_);
            _loc2_++;
         }
         this.goodsArr = param1;
         this.setFuWenGradeMc();
      }
      
      public function setFuWenGradeMc() : void
      {
         var i:int = 0;
         var obj:DisplayObject = null;
         var posArr:Array = null;
         var bg:DisplayObject = null;
         var mc:DisplayObject = null;
         this.noMc2Index = [];
         this.noMc3Index = [];
         while(this.mcSpr.numChildren != 0)
         {
            obj = this.mcSpr.removeChildAt(0);
            if(obj.name == "2")
            {
               this.mc2Arr.push(obj);
            }
            else if(obj.name == "3")
            {
               this.mc3Arr.push(obj);
            }
         }
         i = 0;
         while(i < this.goodsArr.length)
         {
            posArr = this.getXY(i);
            if(this.goodsArr[i].grade == 1)
            {
               bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/fuWenKeHua/" + this.goodsArr[i].grade + ".swf");
               bg.x = posArr[0];
               bg.y = posArr[1];
               this.mcSpr.addChild(bg);
            }
            else if(this.goodsArr[i].grade == 2)
            {
               if(this.mc2Arr.length != 0)
               {
                  mc = this.mc2Arr.shift();
                  mc.x = posArr[0] - 10 + 2 + 8;
                  mc.y = posArr[1] - 10 + 2 + 9;
                  this.mcSpr.addChild(mc);
               }
               else
               {
                  this.noMc2Index.push(i);
                  LoadSwf.AndReturnMC(GameConfig.fileBaseFolder + "res/ui/UIditu/fuWenKeHua/" + this.goodsArr[i].grade + ".swf",function(param1:MovieClip):*
                  {
                     var _loc2_:int = 0;
                     var _loc3_:Array = null;
                     var _loc4_:Sprite = null;
                     if(param1)
                     {
                        param1.play();
                        _loc2_ = noMc2Index.shift();
                        _loc3_ = getXY(_loc2_);
                        _loc4_ = new Sprite();
                        _loc4_.addChild(param1);
                        _loc4_.name = "2";
                        _loc4_.x = _loc3_[0] - 10 + 2 + 8;
                        _loc4_.y = _loc3_[1] - 10 + 2 + 9;
                        mcSpr.addChild(_loc4_);
                     }
                  });
               }
            }
            else if(this.goodsArr[i].grade == 3)
            {
               if(this.mc3Arr.length != 0)
               {
                  mc = this.mc3Arr.shift();
                  mc.x = posArr[0] - 10 + 1 + 9;
                  mc.y = posArr[1] - 10 + 2 + 9;
                  this.mcSpr.addChild(mc);
               }
               else
               {
                  this.noMc3Index.push(i);
                  LoadSwf.AndReturnMC(GameConfig.fileBaseFolder + "res/ui/UIditu/fuWenKeHua/" + this.goodsArr[i].grade + ".swf",function(param1:MovieClip):*
                  {
                     var _loc2_:int = 0;
                     var _loc3_:Array = null;
                     var _loc4_:Sprite = null;
                     if(param1)
                     {
                        param1.play();
                        _loc2_ = noMc3Index.shift();
                        _loc3_ = getXY(_loc2_);
                        _loc4_ = new Sprite();
                        _loc4_.addChild(param1);
                        _loc4_.name = "3";
                        _loc4_.x = _loc3_[0] - 10 + 1 + 9;
                        _loc4_.y = _loc3_[1] - 10 + 2 + 9;
                        mcSpr.addChild(_loc4_);
                     }
                  });
               }
            }
            i++;
         }
         i = int(this.goodsArr.length);
         while(i < 8)
         {
            posArr = this.getXY(i);
            bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/fuWenKeHua/0.swf");
            bg.x = posArr[0];
            bg.y = posArr[1];
            this.mcSpr.addChild(bg);
            i++;
         }
         this.goodsSpr.addChild(this.mcSpr);
      }
      
      public function getXY(param1:int) : Array
      {
         switch(param1)
         {
            case 0:
               return [245,25];
            case 1:
               return [300,100];
            case 2:
               return [300,200];
            case 3:
               return [245,275];
            case 4:
               return [70,275];
            case 5:
               return [15,200];
            case 6:
               return [15,100];
            case 7:
               return [70,25];
            default:
               return [100,100];
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         var _loc2_:ItemFace = param1.target as ItemFace;
         var _loc3_:int = parseInt(_loc2_.name);
         if(this.isMain)
         {
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_FUWENKEHUA_FUWENXINXI_CLICK,"",this.goodsArr[_loc3_].id));
         }
         else
         {
            this._$parent.dispatchEvent(new BaseEvent(TargetAttribute.UI_FUWENKEHUA_FUWENXINXI_CLICK,"",this.goodsArr[_loc3_].id));
         }
      }
      
      private function onFuWenTips(param1:MouseEvent) : void
      {
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc2_:ItemFace = param1.target as ItemFace;
         _loc3_ = parseInt(_loc2_.name);
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               _loc2_.addEventListener(MouseEvent.MOUSE_MOVE,this.onFuWenTips);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc4_ = StaticValue.WHITE_HTML;
               if(this.goodsArr[_loc3_].grade == 1)
               {
                  _loc4_ = StaticValue.GREEN_HTML;
               }
               else if(this.goodsArr[_loc3_].grade == 2)
               {
                  _loc4_ = StaticValue.PURPLE_HTML;
               }
               else if(this.goodsArr[_loc3_].grade == 3)
               {
                  _loc4_ = StaticValue.YELLOW_HTML;
               }
               _loc5_ = "<textformat leading=\'6\'>" + "<font color=\'" + _loc4_ + "\'>" + this.goodsArr[_loc3_].name + "</font></textformat>";
               this.showTip(_loc5_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               _loc2_.removeEventListener(MouseEvent.MOUSE_MOVE,this.onFuWenTips);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 5;
         this.tipCanvas.y = mouseY + 5;
      }
      
      private function setPage(param1:int, param2:int) : void
      {
         this.now = param1;
         if(param1 == 1)
         {
            this.upButton.enabled = false;
            this.upVButton.enabled = false;
         }
         else
         {
            this.upButton.enabled = true;
            this.upVButton.enabled = true;
         }
         if(param1 == param2)
         {
            this.downButton.enabled = false;
            this.downVButton.enabled = false;
         }
         else
         {
            this.downButton.enabled = true;
            this.downVButton.enabled = true;
         }
         this.yeHaoFta.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("第") + param1 + LanResManager.getLanCommonTextWords("页") + "</font>";
      }
      
      public function isDataCanvasShow() : Boolean
      {
         return this.fuWenPanel.visible;
      }
      
      public function setEnableFun() : void
      {
      }
   }
}

