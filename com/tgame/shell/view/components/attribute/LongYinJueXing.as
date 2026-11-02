package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.longyinjuexing.model.info.LongYinJueXingVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import gs.TweenMax;
   
   public class LongYinJueXing extends Sprite
   {
      
      public static const UI_LONGYINJUEXING_GUANBI_CLICK:String = "UI_LONGYINJUEXING_GUANBI_CLICK";
      
      private var bloodMcSpr:Sprite;
      
      private var bloodMcSpr2:Sprite;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var tishengBtn:SecondButton;
      
      private var xiangqianBtn:SecondButton;
      
      private var shuxing:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var box:FCanvas;
      
      private var _$parent:DisplayObject;
      
      private var bloodBit:DisplayObject;
      
      private var gongMc5:MovieClip;
      
      private var tupoBo:Boolean = false;
      
      public const LONGYINJUEXING_MAX:int = 6;
      
      private var mcObj:Object;
      
      private var mcObj2:Object;
      
      private var longyinjuexing:LongYinJueXingTupoCanvas;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var chacheMc:Object;
      
      private var mcUrl:String = "";
      
      private var skillContainer:Sprite;
      
      private var img:Bitmap;
      
      private var fts1:FTextArea;
      
      private var suipian:int = 0;
      
      public function LongYinJueXing()
      {
         var $mask:Sprite;
         var title:FTextArea = null;
         this.mcObj = {};
         this.mcObj2 = {};
         this.chacheMc = {};
         super();
         this.box = new FCanvas();
         this.box.skin = "box";
         addChild(this.box);
         this.box.x = 0;
         this.box.y = 0;
         this.box.width = 403;
         this.box.height = 366;
         this.box = new FCanvas();
         this.box.skin = "box";
         addChild(this.box);
         this.box.x = 2;
         this.box.y = 231 + 32 - 28 - 8;
         this.box.width = 400;
         this.box.height = 135 - 32 + 28 + 8;
         this.bloodMcSpr2 = new Sprite();
         this.bloodMcSpr2.x = 2;
         this.bloodMcSpr2.y = 1;
         addChild(this.bloodMcSpr2);
         this.mcUrl = GameConfig.fileBaseFolder + "res/data/mc/shenbingjuexing/longyin.swf";
         if(this.chacheMc[1] == null)
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.content)
               {
                  chacheMc[1] = _loc2_.content as MovieClip;
                  addChildAt(chacheMc[1],3);
                  chacheMc[1].x = 40;
                  chacheMc[1].y = 30;
               }
            },null,false,this.mcUrl);
         }
         else
         {
            addChildAt(this.chacheMc[1],3);
            this.chacheMc[1].x = 40;
            this.chacheMc[1].y = 30;
         }
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 240 + 50 - 45 - 16 - 116 + 37;
         this.shangyiyeButton.y = 205 + 25 - 30;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         this.cengshu.autoSize;
         addChild(this.cengshu);
         this.cengshu.autoSize = TextFieldAutoSize.LEFT;
         this.cengshu.x = 180 - 50 + 13 + 37;
         this.cengshu.y = 205 + 25 - 30;
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 240 + 50 - 45 - 16;
         this.xiayiyeButton.y = 205 + 25 - 30;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tishengBtn = new SecondButton();
         addChild(this.tishengBtn);
         this.tishengBtn.x = 240 + 50 + 20 + 19;
         this.tishengBtn.y = 205 + 25 + 100 - 56 + 10;
         this.tishengBtn.label = LanResManager.getLanCommonTextWords("开始突破");
         this.tishengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.xiangqianBtn = new SecondButton();
         addChild(this.xiangqianBtn);
         this.xiangqianBtn.x = 240 + 50 + 20 + 19;
         this.xiangqianBtn.y = 205 + 25 + 76 + 10;
         this.xiangqianBtn.label = LanResManager.getLanCommonTextWords("勋章镶嵌");
         this.xiangqianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         title = new FTextArea();
         title.multiline = true;
         title.filters = StaticValue.filter;
         title.width = 100;
         title.height = 110;
         title.x = 24 + 50;
         title.y = 250 + 20 - 35;
         title.textColor = StaticValue.ORANGE;
         title.htmlText = "<textformat leading=\'50\'><font size = \'16\' color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙吟觉醒") + "</font></textformat>";
         addChild(title);
         this.miaoshu = new FTextArea();
         this.miaoshu.autoSize;
         addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 200;
         this.miaoshu.height = 110;
         this.miaoshu.x = 24 - 10;
         this.miaoshu.y = 270 + 10 + 10 - 35;
         this.miaoshu.htmlText = "<font  size = \'14\' color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙吟手中鸣，烽火列边亭。神兵觉醒后，会获得觉醒技能，每突破一层会增加2%技能触发几率和一个神兵镶嵌栏位，神兵可根据镶嵌的高级勋章压制对方相应勋章，消弱对方实力。") + "</font>";
         this.shuxing = new FTextArea();
         this.shuxing.filters = StaticValue.filter;
         this.shuxing.autoSize = TextFieldAutoSize.LEFT;
         this.shuxing.x = 210 + 13;
         this.shuxing.y = 250 + 20 - 35;
         this.shuxing.textColor = StaticValue.ORANGE;
         addChild(this.shuxing);
         this.shuxing.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("增加属性：") + "<br>1000<br>222<br>333<br>444<br>555<br>666<br>777</font>";
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.img.x = 240 + 50 + 20 + 32;
         this.img.y = 250 + 20 - 35;
         addChild(this.img);
         this.skillContainer = new Sprite();
         this.skillContainer.x = 240 + 50 + 20 + 32 + 2;
         this.skillContainer.y = 250 + 20 - 35 + 2;
         addChild(this.skillContainer);
         with(this.skillContainer.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,35,35);
            endFill();
         }
         this.longyinjuexing = new LongYinJueXingTupoCanvas();
         addChild(this.longyinjuexing);
         this.longyinjuexing.x = 138;
         this.longyinjuexing.y = 0;
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
         this.longyinjuexing.mask = $mask;
         addEventListener(UI_LONGYINJUEXING_GUANBI_CLICK,this.onCloseTupo);
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7 + 5;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("龙吟觉醒心法秘籍（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("当前已使用") + suipian + LanResManager.getLanCommonTextWords("颗龙吟觉醒碎片") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + suipian * 10 + LanResManager.getLanCommonTextWords("亿，武功") + suipian * 1000 + LanResManager.getLanCommonTextWords("层") + "<br>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.shangyiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LONGYINJUEXING_PREVIOUS_CLICK));
               break;
            case this.xiayiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LONGYINJUEXING_NEXT_CLICK));
               break;
            case this.tishengBtn:
               if(this.tupoBo)
               {
                  return;
               }
               if(this.longyinjuexing.x > 138)
               {
                  return;
               }
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LONGYINJUEXING_TUPO_CLICK,"",this.lookingId));
               break;
            case this.xiangqianBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LONGYINJUEXING_XIANGQIAN_CLICK));
         }
      }
      
      private function onCloseTupo(param1:BaseEvent) : void
      {
         this.showTuPoPanel(false);
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.longyinjuexing._parent2 = param1;
         this.longyinjuexing._parent3 = this;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:LongYinJueXingVO) : void
      {
         this.setTexiaoBg(param2.nowLookingID);
         this.setShuxingJiacheng(param2.act,param2.def,param2.baoji,param2.shanbi,param2.hp,param2.attack,param2.lv);
         this.setZhaoShiMsg(param2.nowLookingName,param2.nowLookingID,param2.nowID);
         this.setSkill(param2.skill);
         this.setJiHuo(param1);
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.LONGYINJUEXING_XINFAMIJI_ID];
            this.suipian = GameState.dictMainStatus[SpecialGoodsID.LONGYINJUEXING_SUIPIAN_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.LONGYINJUEXING_XINFAMIJI_ID];
            this.suipian = GameState.dictTargetStatus[SpecialGoodsID.LONGYINJUEXING_SUIPIAN_ID];
         }
      }
      
      private function setTexiaoBg(param1:int) : void
      {
         var loadUrl2:String = null;
         var id:int = param1;
         loadUrl2 = GameConfig.fileBaseFolder + "res/data/mc/shenbingjuexing/" + id + ".swf";
         if(this.mcObj2[id] != null)
         {
            if(Boolean(this.gongMc5) && this.gongMc5.parent != null)
            {
               this.gongMc5.stop();
               this.gongMc5.parent.removeChild(this.gongMc5);
            }
            this.gongMc5 = this.mcObj2[id];
            this.gongMc5.play();
            this.bloodMcSpr2.addChild(this.gongMc5);
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl2)
               {
                  return;
               }
               if(Boolean(gongMc5) && gongMc5.parent != null)
               {
                  gongMc5.stop();
                  gongMc5.parent.removeChild(gongMc5);
               }
               gongMc5 = _loc2_.content as MovieClip;
               mcObj2[id] = gongMc5;
               if(gongMc5)
               {
                  gongMc5.play();
                  bloodMcSpr2.addChild(gongMc5);
               }
            },null,false,loadUrl2);
         }
      }
      
      private function setShuxingJiacheng(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         this.shuxing.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + "属性加成：" + "<br>" + LanResManager.getLanCommonTextWords("攻击:") + param1 + "<br>" + LanResManager.getLanCommonTextWords("防御:") + param2 + "<br>" + LanResManager.getLanCommonTextWords("暴击:") + param3 + "<br>" + LanResManager.getLanCommonTextWords("闪避:") + param4 + "<br>" + LanResManager.getLanCommonTextWords("生命:") + param5 + "<br>" + "武功:增加" + param6 + "层" + "<br>" + "技能触发几率:" + param7 / 100 + "%" + "</font>";
      }
      
      private function setZhaoShiMsg(param1:String, param2:int, param3:int = -1) : void
      {
         this.cengshu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>";
         this.nowId = param3;
         this.lookingId = param2;
         if(this.tupoBo)
         {
            this.shangyiyeButton.enabled = false;
            this.tishengBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
            this.tishengBtn.enabled = false;
            this.xiayiyeButton.enabled = false;
         }
         else
         {
            if(param2 <= 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            else
            {
               this.shangyiyeButton.enabled = true;
            }
            if(param2 >= this.LONGYINJUEXING_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
            else
            {
               this.xiayiyeButton.enabled = true;
            }
            if(param2 < param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("已领悟");
               this.tishengBtn.enabled = false;
            }
            else if(param2 == param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
               this.tishengBtn.enabled = true;
            }
            else if(param2 > param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("不可领悟");
               this.tishengBtn.enabled = false;
            }
         }
      }
      
      private function setSkill(param1:Skill) : void
      {
         var _loc2_:ItemFace = null;
         while(this.skillContainer.numChildren > 0)
         {
            this.skillContainer.removeChildAt(0);
         }
         _loc2_ = new ItemFace(param1);
         _loc2_.showKungFuTag();
         _loc2_.setShowCount(false);
         this.skillContainer.addChild(_loc2_);
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.longyinjuexing.x == 138)
            {
               TweenMax.to(this.longyinjuexing,1,{"x":410});
               this.tupoBo = true;
               this.shangyiyeButton.enabled = false;
               this.xiayiyeButton.enabled = false;
               this.tishengBtn.enabled = false;
            }
         }
         else
         {
            if(this.longyinjuexing.x == 410)
            {
               TweenMax.to(this.longyinjuexing,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LONGYINJUEXING_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.shangyiyeButton.enabled = true;
            this.xiayiyeButton.enabled = true;
            this.tishengBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            if(this.lookingId >= this.LONGYINJUEXING_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.longyinjuexing.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.longyinjuexing.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.longyinjuexing.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.longyinjuexing.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.longyinjuexing.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.shangyiyeButton.enabled = false;
         this.xiayiyeButton.enabled = false;
         this.tishengBtn.enabled = false;
         this.xiangqianBtn.enabled = false;
      }
   }
}

