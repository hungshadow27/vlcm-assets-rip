package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.tianshanliuyangzhang.model.info.TianShanLiuYangZhangVo;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import gs.TweenMax;
   
   public class TianShanLiuYangZhang extends Sprite
   {
      
      public static const UI_TIANSHANLIUYANGZHANG_GUANBI_CLICK:String = "UI_TIANSHANLIUYANGZHANG_GUANBI_CLICK";
      
      private var bg:DisplayObject;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var tishengBtn:SecondButton;
      
      private var shuxing:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var tianshanliuyangzhang:TianShanLiuYangZhangTupoCanvas;
      
      private var _$parent:DisplayObject;
      
      private var bg1:DisplayObject;
      
      public const TIANSHANLIUYANGZHANG_MAX:int = 6;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var _avatar:Bitmap;
      
      private var zuox:int = 210;
      
      private var youx:int = 190;
      
      private var kuang:Bitmap;
      
      private var jinengSpr:Sprite;
      
      private var tf:TextFormat;
      
      private var shengsiling:int = 0;
      
      private var jian0:MovieClip;
      
      private var jian1:MovieClip;
      
      private var jian2:MovieClip;
      
      private var jian3:MovieClip;
      
      private var jian4:MovieClip;
      
      private var jian5:MovieClip;
      
      private var int0:int;
      
      private var int1:int;
      
      private var int2:int;
      
      private var int3:int;
      
      private var int4:int;
      
      private var int5:int;
      
      private var sp0:Sprite;
      
      private var sp1:Sprite;
      
      private var sp2:Sprite;
      
      private var sp3:Sprite;
      
      private var sp4:Sprite;
      
      private var sp5:Sprite;
      
      public function TianShanLiuYangZhang()
      {
         var fjjn:FTextArea;
         var $mask:Sprite;
         var jianXArr:Array;
         var jianYArr:Array;
         var i:int;
         var box:FCanvas = null;
         var title:FTextArea = null;
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         box = new FCanvas();
         box.skin = "box";
         addChild(box);
         box.x = 0;
         box.y = 0;
         box.width = 403;
         box.height = 366;
         box = new FCanvas();
         box.skin = "box";
         addChild(box);
         box.x = 2;
         box.y = 231 + 32 - 25 - 2;
         box.width = 400;
         box.height = 135 - 32 + 25 + 2;
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tianshanliuyangzhang/bg.swf");
         this.bg1.x = 2;
         this.bg1.y = 2;
         addChild(this.bg1);
         this._avatar = new Bitmap();
         addChild(this._avatar);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 184 - 76 + 10;
         this.bloodMcSpr.y = 198 - 58 - 80 + 5;
         addChild(this.bloodMcSpr);
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 240 + 50 - 45 - 16 - 116 + 37 + 5;
         this.shangyiyeButton.y = 205 + 25 - 20 + 25 - 10 - 17 + 6 + 2;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         addChild(this.cengshu);
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.background = true;
         this.cengshu.backgroundColor = 1186072;
         this.cengshu.width = 59;
         this.cengshu.height = 17;
         this.cengshu.x = 175;
         this.cengshu.y = 230 - 20 + 25 - 10 - 17 + 6 + 2;
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 240 + 50 - 45 - 16 + 5;
         this.xiayiyeButton.y = 205 + 25 - 20 + 25 - 10 - 17 + 6 + 2;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tishengBtn = new SecondButton();
         addChild(this.tishengBtn);
         this.tishengBtn.x = 240 + 50;
         this.tishengBtn.y = 205 + 25 - 20 + 25 - 10 - 17 + 6 - 2;
         this.tishengBtn.label = LanResManager.getLanCommonTextWords("功法提升");
         this.tishengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         title = new FTextArea();
         title.multiline = true;
         title.filters = StaticValue.filter;
         title.width = 100;
         title.height = 110;
         title.x = 70;
         title.y = 240 + 5;
         title.textColor = StaticValue.ORANGE;
         title.htmlText = "<textformat leading=\'50\'><font size = \'16\' color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("天山六阳掌") + "</font></textformat>";
         addChild(title);
         this.miaoshu = new FTextArea();
         addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 180;
         this.miaoshu.height = 110 + 20;
         this.miaoshu.x = 20;
         this.miaoshu.y = 260 + 5;
         this.miaoshu.htmlText = "";
         this.shuxing = new FTextArea();
         this.shuxing.multiline = true;
         this.shuxing.filters = StaticValue.filter;
         this.shuxing.width = 100 + 100;
         this.shuxing.height = 110;
         this.shuxing.x = 210 + 13;
         this.shuxing.y = 250 - 3 - 25 + 30;
         this.shuxing.textColor = StaticValue.ORANGE;
         addChild(this.shuxing);
         fjjn = new FTextArea();
         fjjn.multiline = true;
         fjjn.filters = StaticValue.filter;
         fjjn.width = 100;
         fjjn.height = 110;
         fjjn.x = 205 + 112 - 9 + 36;
         fjjn.y = 255 + 5 + 5 + 6 + 22;
         fjjn.textColor = StaticValue.ORANGE;
         fjjn.htmlText = "<textformat leading=\'50\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("附加技能") + "</font></textformat>";
         addChild(fjjn);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 325 - 2 + 33;
         this.kuang.y = 300 - 2 + 20;
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 325 + 33;
         this.jinengSpr.y = 300 + 20;
         addChild(this.jinengSpr);
         this.tianshanliuyangzhang = new TianShanLiuYangZhangTupoCanvas();
         addChild(this.tianshanliuyangzhang);
         this.tianshanliuyangzhang.x = 138;
         this.tianshanliuyangzhang.y = 0;
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
         this.tianshanliuyangzhang.mask = $mask;
         addEventListener(UI_TIANSHANLIUYANGZHANG_GUANBI_CLICK,this.onCloseTupo);
         this.mcObj = new Array();
         jianXArr = [38,331,59,299,125,240];
         jianYArr = [166,166,93,93,40,40];
         i = 0;
         while(i < 6)
         {
            this["sp" + i] = new Sprite();
            this["sp" + i].x = jianXArr[i];
            this["sp" + i].y = jianYArr[i];
            addChild(this["sp" + i]);
            i++;
         }
         ToolTips.createToolTips(this.sp0,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("阳歌天钧") + "<br>" + LanResManager.getLanCommonTextWords("已使用") + " : " + int0 + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("攻击") + " : " + int0 * 1000000 + "   " + LanResManager.getLanCommonTextWords("防御") + " : " + int0 * 1000000 + "   " + LanResManager.getLanCommonTextWords("生命") + " : " + int0 * 5000000 + "   " + LanResManager.getLanCommonTextWords("武功") + " : " + int0 * 5 + "   " + LanResManager.getLanCommonTextWords("战斗力") + " : " + int0 * 10000;
            return _loc1_ + "</textformat>";
         });
         ToolTips.createToolTips(this.sp1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("阳春白雪") + "<br>" + LanResManager.getLanCommonTextWords("已使用") + " : " + int1 + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("攻击") + " : " + int1 * 1000000 + "   " + LanResManager.getLanCommonTextWords("防御") + " : " + int1 * 1000000 + "   " + LanResManager.getLanCommonTextWords("生命") + " : " + int1 * 5000000 + "   " + LanResManager.getLanCommonTextWords("武功") + " : " + int1 * 5 + "   " + LanResManager.getLanCommonTextWords("战斗力") + " : " + int1 * 10000;
            return _loc1_ + "</textformat>";
         });
         ToolTips.createToolTips(this.sp2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("阳关三叠") + "<br>" + LanResManager.getLanCommonTextWords("已使用") + " : " + int2 + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("攻击") + " : " + int2 * 1000000 + "   " + LanResManager.getLanCommonTextWords("防御") + " : " + int2 * 1000000 + "   " + LanResManager.getLanCommonTextWords("生命") + " : " + int2 * 5000000 + "   " + LanResManager.getLanCommonTextWords("武功") + " : " + int2 * 5 + "   " + LanResManager.getLanCommonTextWords("战斗力") + " : " + int2 * 10000;
            return _loc1_ + "</textformat>";
         });
         ToolTips.createToolTips(this.sp3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("阳早天钧") + "<br>" + LanResManager.getLanCommonTextWords("已使用") + " : " + int3 + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("攻击") + " : " + int3 * 1000000 + "   " + LanResManager.getLanCommonTextWords("防御") + " : " + int3 * 1000000 + "   " + LanResManager.getLanCommonTextWords("生命") + " : " + int3 * 5000000 + "   " + LanResManager.getLanCommonTextWords("武功") + " : " + int3 * 5 + "   " + LanResManager.getLanCommonTextWords("战斗力") + " : " + int3 * 10000;
            return _loc1_ + "</textformat>";
         });
         ToolTips.createToolTips(this.sp4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("阳洞山瑶") + "<br>" + LanResManager.getLanCommonTextWords("已使用") + " : " + int4 + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("攻击") + " : " + int4 * 1000000 + "   " + LanResManager.getLanCommonTextWords("防御") + " : " + int4 * 1000000 + "   " + LanResManager.getLanCommonTextWords("生命") + " : " + int4 * 5000000 + "   " + LanResManager.getLanCommonTextWords("武功") + " : " + int4 * 5 + "   " + LanResManager.getLanCommonTextWords("战斗力") + " : " + int4 * 10000;
            return _loc1_ + "</textformat>";
         });
         ToolTips.createToolTips(this.sp5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("阳手回春") + "<br>" + LanResManager.getLanCommonTextWords("已使用") + " : " + int5 + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("攻击") + " : " + int5 * 1000000 + "   " + LanResManager.getLanCommonTextWords("防御") + " : " + int5 * 1000000 + "   " + LanResManager.getLanCommonTextWords("生命") + " : " + int5 * 5000000 + "   " + LanResManager.getLanCommonTextWords("武功") + " : " + int5 * 5 + "   " + LanResManager.getLanCommonTextWords("战斗力") + " : " + int5 * 10000;
            return _loc1_ + "</textformat>";
         });
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            jian0 = _loc2_.content as MovieClip;
            sp0.addChild(jian0);
         },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/tianshanliuyangzhang/qiu0.swf");
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            jian1 = _loc2_.content as MovieClip;
            sp1.addChild(jian1);
         },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/tianshanliuyangzhang/qiu1.swf");
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            jian2 = _loc2_.content as MovieClip;
            sp2.addChild(jian2);
         },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/tianshanliuyangzhang/qiu2.swf");
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            jian3 = _loc2_.content as MovieClip;
            sp3.addChild(jian3);
         },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/tianshanliuyangzhang/qiu3.swf");
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            jian4 = _loc2_.content as MovieClip;
            sp4.addChild(jian4);
         },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/tianshanliuyangzhang/qiu4.swf");
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            jian5 = _loc2_.content as MovieClip;
            sp5.addChild(jian5);
         },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/tianshanliuyangzhang/qiu5.swf");
      }
      
      private function onCloseTupo(param1:BaseEvent) : void
      {
         this.showTuPoPanel(false);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.shangyiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TIANSHANLIUYANGZHANG_PREVIOUS_CLICK,"",this.lookingId - 1));
               break;
            case this.xiayiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TIANSHANLIUYANGZHANG_NEXT_CLICK,"",this.lookingId + 1));
               break;
            case this.tishengBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TIANSHANLIUYANGZHANG_TUPO_CLICK,"",this.lookingId));
               this.showTuPoPanel(true);
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.tianshanliuyangzhang._parent2 = param1;
         this.tianshanliuyangzhang._parent3 = this;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:TianShanLiuYangZhangVo) : void
      {
         this.setBg(param2.nowLookingID);
         this.setShuxingJiacheng(param2.miaoshu,param2.act,param2.def,param2.hp,param2.bj,param2.sb);
         this.setZhaoShiMsg(param2.nowLookingName,param2.nowLookingID,param2.nowID);
         this.setSkill(param2.skillid,param2.isLearn);
         this.setJiHuo(param1);
      }
      
      private function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.sp0.visible = GameState.dictMainStatus[725552];
            this.sp1.visible = GameState.dictMainStatus[725554];
            this.sp2.visible = GameState.dictMainStatus[725556];
            this.sp3.visible = GameState.dictMainStatus[725558];
            this.sp4.visible = GameState.dictMainStatus[725560];
            this.sp5.visible = GameState.dictMainStatus[725562];
            this.int0 = GameState.dictMainStatus[725553];
            this.int1 = GameState.dictMainStatus[725555];
            this.int2 = GameState.dictMainStatus[725557];
            this.int3 = GameState.dictMainStatus[725559];
            this.int4 = GameState.dictMainStatus[725561];
            this.int5 = GameState.dictMainStatus[725563];
         }
         else
         {
            this.sp0.visible = GameState.dictTargetStatus[725552];
            this.sp1.visible = GameState.dictTargetStatus[725554];
            this.sp2.visible = GameState.dictTargetStatus[725556];
            this.sp3.visible = GameState.dictTargetStatus[725558];
            this.sp4.visible = GameState.dictTargetStatus[725560];
            this.sp5.visible = GameState.dictTargetStatus[725562];
            this.int0 = GameState.dictTargetStatus[725553];
            this.int1 = GameState.dictTargetStatus[725555];
            this.int2 = GameState.dictTargetStatus[725557];
            this.int3 = GameState.dictTargetStatus[725559];
            this.int4 = GameState.dictTargetStatus[725561];
            this.int5 = GameState.dictTargetStatus[725563];
         }
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         this._avatar.x = 300 - this._avatar.width / 2 - this.youx - 7 + 100;
         this._avatar.y = 150 - this._avatar.height + 20 + 39 - 2;
      }
      
      private function setBg(param1:int) : void
      {
         var loadUrl:String = null;
         var lookId:int = param1;
         loadUrl = GameConfig.fileBaseFolder + "res/data/mc/tianshanliuyangzhang/" + lookId + ".swf";
         if(Boolean(this.bloodMc) && this.bloodMc.parent != null)
         {
            this.bloodMc.stop();
            this.bloodMc.parent.removeChild(this.bloodMc);
         }
         while(this.bloodMcSpr.numChildren > 0)
         {
            this.bloodMcSpr.removeChildAt(0);
         }
         if(this.mcObj[lookId] != null)
         {
            this.bloodMc = this.mcObj[lookId];
            this.bloodMc.play();
            this.bloodMcSpr.addChild(this.bloodMc);
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl)
               {
                  return;
               }
               if(Boolean(bloodMc) && bloodMc.parent != null)
               {
                  bloodMc.stop();
                  bloodMc.parent.removeChild(bloodMc);
               }
               while(bloodMcSpr.numChildren > 0)
               {
                  bloodMcSpr.removeChildAt(0);
               }
               bloodMc = _loc2_.content as MovieClip;
               mcObj[lookId] = bloodMc;
               if(bloodMc)
               {
                  bloodMcSpr.addChild(bloodMc);
               }
            },null,false,loadUrl);
         }
      }
      
      public function setShuxingJiacheng(param1:String, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         this.miaoshu.htmlText = "<font  color=\'" + StaticValue.YELLOW_HTML + "\'>" + param1 + "</font>";
         this.shuxing.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("人物属性加成：") + "<br>" + LanResManager.getLanCommonTextWords("攻击:") + param2 + "<br>" + LanResManager.getLanCommonTextWords("防御:") + param3 + "<br>" + LanResManager.getLanCommonTextWords("生命:") + param4 + "<br>" + LanResManager.getLanCommonTextWords("暴击:") + param5 + "<br>" + LanResManager.getLanCommonTextWords("闪避:") + param6 + "</font>";
      }
      
      public function setZhaoShiMsg(param1:String, param2:int, param3:int = -1) : void
      {
         this.cengshu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>";
         this.nowId = param3;
         this.lookingId = param2;
         if(this.tupoBo)
         {
            this.shangyiyeButton.enabled = false;
            this.tishengBtn.label = LanResManager.getLanCommonTextWords("功法提升");
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
            if(param2 >= this.TIANSHANLIUYANGZHANG_MAX)
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
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("功法提升");
               this.tishengBtn.enabled = true;
            }
            else if(param2 > param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("不可领悟");
               this.tishengBtn.enabled = false;
            }
         }
      }
      
      public function setSkill(param1:int, param2:Boolean) : void
      {
         var _loc4_:ItemFace = null;
         while(this.jinengSpr.numChildren > 0)
         {
            this.jinengSpr.removeChildAt(0);
         }
         var _loc3_:Skill = new Skill(param1);
         if(param2)
         {
            _loc3_.isLearn = 1;
         }
         else
         {
            _loc3_.isLearn = 0;
         }
         _loc4_ = new ItemFace(_loc3_);
         _loc4_.showKungFuTag();
         _loc4_.setShowCount(false);
         this.jinengSpr.addChild(_loc4_);
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.tianshanliuyangzhang.x == 138)
            {
               TweenMax.to(this.tianshanliuyangzhang,1,{"x":410});
               this.tupoBo = true;
               this.shangyiyeButton.enabled = false;
               this.xiayiyeButton.enabled = false;
               this.tishengBtn.enabled = false;
            }
         }
         else
         {
            if(this.tianshanliuyangzhang.x == 410)
            {
               TweenMax.to(this.tianshanliuyangzhang,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TIANSHANLIUYANGZHANG_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.shangyiyeButton.enabled = true;
            this.xiayiyeButton.enabled = true;
            this.tishengBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            if(this.lookingId >= this.TIANSHANLIUYANGZHANG_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.tianshanliuyangzhang.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.tianshanliuyangzhang.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.tianshanliuyangzhang.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.tianshanliuyangzhang.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.tianshanliuyangzhang.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.shangyiyeButton.enabled = false;
         this.xiayiyeButton.enabled = false;
         this.tishengBtn.enabled = false;
      }
   }
}

