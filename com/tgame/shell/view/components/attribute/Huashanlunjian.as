package com.tgame.shell.view.components.attribute
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import gs.TweenMax;
   
   public class Huashanlunjian extends Sprite
   {
      
      public static const UI_HUASHANLUNJIAN_GUANBI_CLICK:String = "UI_HUASHANLUNJIAN_GUANBI_CLICK";
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var tf:TextFormat;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var _chuangGuanBtn:SmallButton;
      
      public var $parent:DisplayObject;
      
      private var _textList:Vector.<FLabel>;
      
      private var _barList:Vector.<ColorBar>;
      
      private var _bg:DisplayObject;
      
      private var ftDesc:FTextArea;
      
      private var skillSpr:Sprite;
      
      private var tupoPanel:HuashanlunjianTupoCanvase;
      
      private var tupoBo:Boolean = false;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var LV_MAX:int = 6;
      
      private var bg:DisplayObject;
      
      private var isLearn:int = 0;
      
      private var sk:int = -1;
      
      private var equipContainers:Sprite;
      
      private var kuangHD:Bitmap;
      
      private var isMain:Boolean;
      
      private var fts6:FTextArea;
      
      private var check1:FCheckBox;
      
      private var checkLabel1:FLabel;
      
      private var _shiyongBtn:SmallButton;
      
      private var goods:Goods;
      
      public function Huashanlunjian()
      {
         var _loc1_:FCanvas = null;
         super();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tf = new TextFormat();
         this.tf.align = "center";
         _loc1_ = new FCanvas();
         _loc1_.skin = "box";
         _loc1_.x = 0;
         _loc1_.y = 200;
         _loc1_.width = 403;
         _loc1_.height = 65;
         this.init();
      }
      
      private function init() : void
      {
         var $mask:Sprite;
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huashanlunjian/bg.swf");
         this.bg.x = 0;
         this.bg.y = 2;
         addChild(this.bg);
         addEventListener(UI_HUASHANLUNJIAN_GUANBI_CLICK,this.aa1);
         this.cbInit();
         this.skillSpr = new Sprite();
         this.skillSpr.x = 0;
         this.skillSpr.y = 317;
         addChild(this.skillSpr);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 160;
         this.previousButton.y = 200 + 10;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         addChild(this.cengshu);
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.background = true;
         this.cengshu.backgroundColor = 1186072;
         this.cengshu.width = 55;
         this.cengshu.height = 17;
         this.cengshu.x = 175;
         this.cengshu.y = 200 + 10;
         this.cengshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("第一层") + "</font>";
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = 230;
         this.nextButton.y = 200 + 10;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ftDesc = new FTextArea();
         this.ftDesc.x = 205;
         this.ftDesc.y = 242;
         this.ftDesc.width = 200;
         this.ftDesc.height = 60;
         this.ftDesc.wordWrap = true;
         this.ftDesc.htmlText = "";
         this.ftDesc.textColor = StaticValue.WHITE;
         addChild(this.ftDesc);
         this._chuangGuanBtn = new SmallButton();
         this._chuangGuanBtn.label = LanResManager.getLanCommonTextWords("境界突破");
         addChild(this._chuangGuanBtn);
         this._chuangGuanBtn.x = 260;
         this._chuangGuanBtn.y = 290;
         this._chuangGuanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this._shiyongBtn = new SmallButton();
         this._shiyongBtn.label = LanResManager.getLanCommonTextWords("使用");
         addChild(this._shiyongBtn);
         this._shiyongBtn.x = 338;
         this._shiyongBtn.y = 290;
         this._shiyongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tupoPanel = new HuashanlunjianTupoCanvase();
         addChild(this.tupoPanel);
         this.tupoPanel.x = 138;
         this.tupoPanel.y = -10;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = -10;
         with($mask.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,500,390);
            endFill();
         }
         this.tupoPanel.mask = $mask;
         this.equipContainers = new Sprite();
         this.equipContainers.x = 343 + 8;
         this.equipContainers.y = 12 + 30 + 135 + 35 - 30;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
         addChild(this.equipContainers);
         this.fts6 = new FTextArea();
         this.fts6.x = 10 + 280 - 16 + 25;
         this.fts6.y = 7 + 60 + 40 + 20 + 70 + 33 - 30;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 44;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("逆炎");
         this.fts6.visible = false;
         addChild(this.fts6);
         this.check1 = new FCheckBox();
         addChild(this.check1);
         this.check1.visible = false;
         this.check1.x = 120 + 280 - 55 - 16;
         this.check1.y = 7 + 60 + 40 + 20 + 70 + 33 - 30;
         this.check1.addEventListener(MouseEvent.CLICK,this.onCheckClick);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check1.selectState,49]));
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.showTupoPanel(false);
      }
      
      private function cbInit() : void
      {
         var _loc2_:FLabel = null;
         var _loc3_:FLabel = null;
         var _loc4_:FLabel = null;
         var _loc5_:Bitmap = null;
         var _loc6_:ColorBar = null;
         var _loc1_:Array = [LanResManager.getLanCommonTextWords("攻 击 力"),LanResManager.getLanCommonTextWords("防 御 力"),LanResManager.getLanCommonTextWords("生 命 力"),LanResManager.getLanCommonTextWords("武功层数")];
         this._textList = new Vector.<FLabel>();
         this._barList = new Vector.<ColorBar>();
         var _loc7_:uint = 0;
         while(_loc7_ < 4)
         {
            _loc2_ = new FLabel();
            addChild(_loc2_);
            _loc2_.filters = StaticValue.filter;
            _loc2_.textColor = StaticValue.ORANGE;
            _loc2_.text = String(_loc1_[_loc7_]);
            _loc2_.x = 10;
            _loc2_.y = 18 * (_loc7_ + 1) + 223;
            _loc5_ = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
            addChild(_loc5_);
            _loc5_.x = _loc2_.x + 55;
            _loc5_.y = 19 * (_loc7_ + 1) + 223;
            _loc6_ = new ColorBar(5,123,5);
            addChild(_loc6_);
            _loc6_.setValue(10000,100000);
            _loc6_.x = _loc5_.x + 4;
            _loc6_.y = _loc5_.y + 3;
            this._barList.push(_loc6_);
            _loc7_++;
         }
      }
      
      private function onClick(param1:MouseEvent = null) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this.sk = 1;
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_HUASHANLUNJIAN_SHANGYIYE_CLICK));
               break;
            case this.nextButton:
               this.sk = 1;
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_HUASHANLUNJIAN_XIAYIYE_CLICK));
               break;
            case this._chuangGuanBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_HUASHANLUNJIAN_LINGWU_SHOW));
               break;
            case this._shiyongBtn:
               if(this._shiyongBtn.enabled && this.goods != null)
               {
                  PipeManager.sendMsg(PipeConstants.SEND_53099,[23,this.goods.id,this.goods.position]);
               }
         }
      }
      
      private function getGoodsShiyong(param1:int) : void
      {
         this.goods = null;
         var _loc2_:Array = GameInstance.mainCharData.goodsInfo.getGoodsArrByID(param1,true);
         if(param1 > 0 && _loc2_.length > 0)
         {
            this.goods = _loc2_[0];
            this._shiyongBtn.enabled = true;
            return;
         }
         this._shiyongBtn.enabled = false;
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
         this.tupoPanel._parent2 = param1;
         this.tupoPanel._parent3 = this;
      }
      
      public function setInit(param1:Boolean, param2:Object, param3:int, param4:int, param5:String, param6:String, param7:String) : void
      {
         this.isMain = param1;
         if(param3 == 1)
         {
            this.previousButton.enabled = false;
         }
         else
         {
            this.previousButton.enabled = true;
         }
         if(param3 == 6)
         {
            this.nextButton.enabled = false;
         }
         else
         {
            this.nextButton.enabled = true;
         }
         this.setCB(param1,param2);
         this.reloadImg(param3,param4);
         var _loc8_:Array = param5.split(",");
         if(int(param2.act) == int(param2.actMax) && param4 != 6 && param4 <= param3)
         {
            this._chuangGuanBtn.enabled = true;
            this.sk = -1;
         }
         else
         {
            this._chuangGuanBtn.enabled = false;
         }
         if(this.sk != 1)
         {
            if(param4 < 6)
            {
               if(param4 == 1)
               {
                  this.isLearn = 0;
               }
               else
               {
                  this.isLearn = param4 - 1;
               }
            }
            else if(int(param2.act) == int(param2.actMax) && Boolean(int(param2.act != 0)))
            {
               this.isLearn = 6;
            }
            else
            {
               this.isLearn = 5;
            }
         }
         if(int(param2.act) == int(param2.actMax) && param4 == 6 && Boolean(int(param2.act != 0)))
         {
            this.isLearn = 6;
         }
         this.setSkill(this.isLearn,_loc8_);
         this.cengshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + param7 + "</font>";
         this.ftDesc.htmlText = param6;
         this.getGoodsShiyong(param2.xiaohaoGoodsID);
      }
      
      private function setCB(param1:Boolean, param2:Object) : void
      {
         this._barList[0].setValue(param2.act,param2.actMax);
         this._barList[1].setValue(param2.def,param2.defMax);
         this._barList[2].setValue(param2.hp,param2.hpMax);
         this._barList[3].setValue(param2.lv,param2.lvMax);
      }
      
      private function reloadImg(param1:int, param2:int) : void
      {
         var _loc3_:int = param1;
         if(param1 <= 0)
         {
            _loc3_ = 1;
         }
         else
         {
            _loc3_ = param1;
         }
         if(this._bg != null && this._bg.parent != null)
         {
            this._bg.parent.removeChild(this._bg);
         }
         this._bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huashanlunjian/" + _loc3_ + ".swf");
         if(param1 > param2)
         {
            this._bg.filters = Tools.blackWhiteFilter;
         }
         this._bg.x = 1;
         this._bg.y = 2;
         addChildAt(this._bg,2);
      }
      
      private function setSkill(param1:int, param2:Array) : void
      {
         var _loc4_:Skill = null;
         var _loc5_:ItemFace = null;
         while(this.skillSpr.numChildren > 0)
         {
            this.skillSpr.removeChildAt(0);
         }
         var _loc3_:int = 0;
         while(_loc3_ < 6)
         {
            _loc4_ = new Skill(int(param2[_loc3_]));
            if(_loc3_ < param1)
            {
               _loc4_.isLearn = 1;
            }
            else if(param1 == 6)
            {
               _loc4_.isLearn = 1;
            }
            else
            {
               _loc4_.isLearn = 0;
            }
            _loc5_ = new ItemFace(_loc4_);
            _loc5_.setShowCount(false);
            _loc5_.x = 24 + _loc3_ * 64;
            _loc5_.y = 5;
            this.skillSpr.addChild(_loc5_);
            if(_loc4_.isLearn == 1)
            {
               _loc5_.filters = [];
            }
            else
            {
               _loc5_.filters = Tools.blackWhiteFilter;
            }
            _loc3_++;
         }
      }
      
      public function showTupoPanel(param1:Boolean) : void
      {
         this.tupoBo = param1;
         if(param1)
         {
            if(this.tupoPanel.x == 138)
            {
               TweenMax.to(this.tupoPanel,1,{"x":410});
               this.tupoBo = true;
               this.previousButton.enabled = false;
               this.nextButton.enabled = false;
               this._chuangGuanBtn.enabled = false;
            }
         }
         else
         {
            if(this.tupoPanel.x == 410)
            {
               TweenMax.to(this.tupoPanel,1,{"x":138});
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_HUASHANLUNJIAN_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.previousButton.enabled = true;
            this.nextButton.enabled = true;
            this._chuangGuanBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.previousButton.enabled = false;
            }
            if(this.lookingId >= this.LV_MAX)
            {
               this.nextButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.tupoPanel.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.tupoPanel.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.tupoPanel.setZhufuzhi(param1,param2,param3);
      }
      
      public function setTupoGoods(param1:Goods, param2:Boolean) : void
      {
         this.tupoPanel.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.tupoPanel.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.previousButton.enabled = false;
         this.nextButton.enabled = false;
         this._chuangGuanBtn.enabled = false;
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_HuaShanLunJian(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainers.numChildren > 0)
         {
            this.equipContainers.removeChildAt(0);
         }
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.equipContainers.addChild(this.kuangHD);
         this.kuangHD.x = 0;
         this.kuangHD.y = 0;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_HUASHANLUNJIAN_NIYAN)
            {
               _loc4_.x = 2;
               _loc4_.y = 2;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.fts6.visible = true;
                  this.check1.visible = true;
               }
               else
               {
                  this.fts6.visible = false;
                  this.check1.visible = false;
               }
            }
            _loc2_++;
         }
      }
   }
}

