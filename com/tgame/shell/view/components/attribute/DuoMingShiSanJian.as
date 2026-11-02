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
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.duomingshisanjian.model.info.DuoMingShiSanJianVo;
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
   import flash.text.TextFormat;
   import gs.TweenMax;
   
   public class DuoMingShiSanJian extends Sprite
   {
      
      public static const UI_DUOMINGSHISANJIAN_GUANBI_CLICK:String = "UI_DUOMINGSHISANJIAN_GUANBI_CLICK";
      
      private var bg:DisplayObject;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var tishengBtn:SecondButton;
      
      private var shuxing:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var duomingshisanjian:DuoMingShiSanJianTupoCanvas;
      
      private var _$parent:DisplayObject;
      
      public const CANHEZHI_MAX:int = 13;
      
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
      
      private var jian0:DisplayObject;
      
      private var jian1:DisplayObject;
      
      private var jian2:DisplayObject;
      
      private var jian3:DisplayObject;
      
      private var jian4:DisplayObject;
      
      private var jian5:DisplayObject;
      
      private var jian6:DisplayObject;
      
      private var jian7:DisplayObject;
      
      private var jian8:DisplayObject;
      
      private var jian9:DisplayObject;
      
      private var jian10:DisplayObject;
      
      private var jian11:DisplayObject;
      
      private var jian12:DisplayObject;
      
      public function DuoMingShiSanJian()
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
         box.x = 2;
         box.y = 231 + 32 - 25;
         box.width = 400;
         box.height = 135 - 32 + 25;
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/duomingshisanjian/bg.swf");
         this.bg.x = 2;
         this.bg.y = 2;
         addChild(this.bg);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 129;
         this.bloodMcSpr.y = 2;
         addChild(this.bloodMcSpr);
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 240 + 50 - 45 - 16 - 116 + 37;
         this.shangyiyeButton.y = 205 + 25 - 20 + 25 - 18 - 3;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         this.cengshu.autoSize;
         addChild(this.cengshu);
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.background = true;
         this.cengshu.backgroundColor = 1186072;
         this.cengshu.width = 59;
         this.cengshu.height = 17;
         this.cengshu.x = 170;
         this.cengshu.y = 230 - 20 + 25 - 18 - 3;
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 240 + 50 - 45 - 16;
         this.xiayiyeButton.y = 205 + 25 - 20 + 25 - 18 - 3;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tishengBtn = new SecondButton();
         addChild(this.tishengBtn);
         this.tishengBtn.x = 240 + 50 + 20;
         this.tishengBtn.y = 205 + 25 - 20 + 25 - 18 - 3 - 3;
         this.tishengBtn.label = LanResManager.getLanCommonTextWords("功法提升");
         this.tishengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         title = new FTextArea();
         title.multiline = true;
         title.filters = StaticValue.filter;
         title.width = 100;
         title.height = 150;
         title.x = 24 + 50;
         title.y = 250 + 12 - 15 + 23 - 21;
         title.textColor = StaticValue.ORANGE;
         title.htmlText = "<textformat leading=\'50\'><font size = \'16\' color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("夺命十三剑") + "</font></textformat>";
         addChild(title);
         this.miaoshu = new FTextArea();
         addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.autoSize = TextFieldAutoSize.LEFT;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 230 - 12;
         this.miaoshu.x = 23;
         this.miaoshu.y = 288 + 7 - 21;
         this.miaoshu.htmlText = "";
         this.shuxing = new FTextArea();
         this.shuxing.multiline = true;
         this.shuxing.filters = StaticValue.filter;
         this.shuxing.width = 100 + 10;
         this.shuxing.height = 110;
         this.shuxing.x = 210 + 13 + 17;
         this.shuxing.y = 250 + 20 - 3 - 20;
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
         fjjn.htmlText = "<textformat leading=\'50\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("顶级技能") + "</font></textformat>";
         addChild(fjjn);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 325 - 2 + 33;
         this.kuang.y = 300 - 2 + 20;
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 325 + 33;
         this.jinengSpr.y = 300 + 20;
         addChild(this.jinengSpr);
         this.duomingshisanjian = new DuoMingShiSanJianTupoCanvas();
         addChild(this.duomingshisanjian);
         this.duomingshisanjian.x = 138;
         this.duomingshisanjian.y = 0;
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
         this.duomingshisanjian.mask = $mask;
         addEventListener(UI_DUOMINGSHISANJIAN_GUANBI_CLICK,this.onCloseTupo);
         this.mcObj = new Array();
         jianXArr = [15,359,22,349,39,332,67,307,100,279,140,243,191];
         jianYArr = [185,185,150,150,115,115,75,75,47,47,22,22,3];
         i = 0;
         while(i < 13)
         {
            this["jian" + i] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/duomingshisanjian/qiu.swf");
            this["jian" + i].x = jianXArr[i];
            this["jian" + i].y = jianYArr[i];
            addChild(this["jian" + i]);
            i++;
         }
         ToolTips.createToolTips(this.jian0,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("罡气剑魂：激活夺命十三剑的玩家，可双击使用罡气剑魂激活夺命剑魂特效，且攻击时有");
            return _loc1_ + "</textformat>";
         });
         ToolTips.createToolTips(this.jian1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            return _loc1_ + ("<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("阴阳剑魂：激活夺命十三剑的玩家，可双击使用阴阳剑魂激活夺命剑魂特效，且被攻击时"));
         });
         ToolTips.createToolTips(this.jian2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("噬灵剑魂：激活夺命十三剑的玩家，可双击使用噬灵剑魂激活夺命剑魂特效，攻击时有几");
            return _loc1_ + "</textformat>";
         });
         ToolTips.createToolTips(this.jian3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("刺客剑魂：激活夺命十三剑的玩家，可双击使用刺客剑魂激活夺命剑魂特效，攻击时有几");
            return _loc1_ + "</textformat>";
         });
         ToolTips.createToolTips(this.jian4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("天地剑魂：激活夺命十三剑的玩家，可双击使用天地剑魂激活夺命剑魂特效，被攻击时有");
            return _loc1_ + "</textformat>";
         });
         ToolTips.createToolTips(this.jian5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("魔印剑魂：激活夺命十三剑的玩家，可双击使用魔印剑魂激活夺命剑魂特效，攻击时有几");
            LanResManager.getLanCommonTextWords("率使对手命中魔印剑魂，持续60秒；当剑魂累计到6个时，可瞬间秒杀对手。") + "<br>";
            return _loc1_;
         });
         ToolTips.createToolTips(this.jian6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("幻影剑魂：激活夺命十三剑的玩家，可双击使用幻影剑魂激活夺命剑魂特效，攻击时有几");
            return _loc1_ + "</textformat>";
         });
         ToolTips.createToolTips(this.jian7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("万魄剑魂：激活夺命十三剑的玩家，可双击使用万魄剑魂激活夺命剑魂特效，攻击时有几");
            return _loc1_ + "</textformat>";
         });
         ToolTips.createToolTips(this.jian8,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("冰封剑魂：激活夺命十三剑的玩家，可双击使用冰封剑魂激活夺命剑魂特效，攻击时有几");
            return _loc1_ + "</textformat>";
         });
         ToolTips.createToolTips(this.jian9,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("极限剑魂：激活夺命十三剑的玩家，可双击使用极限剑魂激活夺命剑魂特效，所有剑魂的");
            return _loc1_ + "</textformat>";
         });
         ToolTips.createToolTips(this.jian10,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("力量剑魂：激活夺命十三剑的玩家，可双击使用力量剑魂激活夺命剑魂特效，提升人物攻");
            return _loc1_ + "</textformat>";
         });
         ToolTips.createToolTips(this.jian11,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            return _loc1_ + ("<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("生命剑魂：激活夺命十三剑的玩家，可双击使用生命剑魂激活夺命剑魂特效，提升人物生"));
         });
         ToolTips.createToolTips(this.jian12,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            return _loc1_ + ("<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("护甲剑魂：激活夺命十三剑的玩家，可双击使用护甲剑魂激活夺命剑魂特效，提升人物防"));
         });
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
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUOMINGSHISANJIAN_PREVIOUS_CLICK,"",this.lookingId - 1));
               break;
            case this.xiayiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUOMINGSHISANJIAN_NEXT_CLICK,"",this.lookingId + 1));
               break;
            case this.tishengBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUOMINGSHISANJIAN_TUPO_CLICK,"",this.lookingId));
               this.showTuPoPanel(true);
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.duomingshisanjian._parent2 = param1;
         this.duomingshisanjian._parent3 = this;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:DuoMingShiSanJianVo) : void
      {
         this.isMain = param1;
         this.setBg(param2.nowLookingID);
         this.setShuxingJiacheng(param2.miaoshu,param2.act,param2.def,param2.hp,param2.baoji,param2.shanbi);
         this.setZhaoShiMsg(param2.nowLookingName,param2.nowLookingID,param2.nowID);
         this.setSkill(param2.skillid,param2.isLearn);
         this.setxueshaJiHuo(param1);
      }
      
      public function setxueshaJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.jian0.visible = GameState.dictMainStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN0_ID];
            this.jian1.visible = GameState.dictMainStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN1_ID];
            this.jian2.visible = GameState.dictMainStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN2_ID];
            this.jian3.visible = GameState.dictMainStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN3_ID];
            this.jian4.visible = GameState.dictMainStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN4_ID];
            this.jian5.visible = GameState.dictMainStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN5_ID];
            this.jian6.visible = GameState.dictMainStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN6_ID];
            this.jian7.visible = GameState.dictMainStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN7_ID];
            this.jian8.visible = GameState.dictMainStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN8_ID];
            this.jian9.visible = GameState.dictMainStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN9_ID];
            this.jian10.visible = GameState.dictMainStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN10_ID];
            this.jian11.visible = GameState.dictMainStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN11_ID];
            this.jian12.visible = GameState.dictMainStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN12_ID];
         }
         else
         {
            this.jian0.visible = GameState.dictTargetStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN0_ID];
            this.jian1.visible = GameState.dictTargetStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN1_ID];
            this.jian2.visible = GameState.dictTargetStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN2_ID];
            this.jian3.visible = GameState.dictTargetStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN3_ID];
            this.jian4.visible = GameState.dictTargetStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN4_ID];
            this.jian5.visible = GameState.dictTargetStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN5_ID];
            this.jian6.visible = GameState.dictTargetStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN6_ID];
            this.jian7.visible = GameState.dictTargetStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN7_ID];
            this.jian8.visible = GameState.dictTargetStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN8_ID];
            this.jian9.visible = GameState.dictTargetStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN9_ID];
            this.jian10.visible = GameState.dictTargetStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN10_ID];
            this.jian11.visible = GameState.dictTargetStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN11_ID];
            this.jian12.visible = GameState.dictTargetStatus[SpecialGoodsID.DUOMINGSHISANJIAN_JIAN12_ID];
         }
      }
      
      private function setBg(param1:int) : void
      {
         var mcId:int = 0;
         var loadUrl:String = null;
         var id:int = param1;
         mcId = 0;
         if(id == 1 || id == 2 || id == 3)
         {
            mcId = 1;
         }
         else if(id == 4 || id == 5 || id == 6)
         {
            mcId = 2;
         }
         else if(id == 7 || id == 8 || id == 9)
         {
            mcId = 3;
         }
         else if(id == 10 || id == 11 || id == 12)
         {
            mcId = 4;
         }
         else if(id == 13)
         {
            mcId = 5;
         }
         loadUrl = GameConfig.fileBaseFolder + "res/data/mc/duomingshisanjian/" + mcId + ".swf";
         if(Boolean(this.bloodMc) && this.bloodMc.parent != null)
         {
            this.bloodMc.stop();
            this.bloodMc.parent.removeChild(this.bloodMc);
         }
         while(this.bloodMcSpr.numChildren > 0)
         {
            this.bloodMcSpr.removeChildAt(0);
         }
         if(this.mcObj[mcId] != null)
         {
            this.bloodMc = this.mcObj[mcId];
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
               mcObj[mcId] = bloodMc;
               if(bloodMc)
               {
                  bloodMcSpr.addChild(bloodMc);
               }
            },null,false,loadUrl);
         }
      }
      
      public function removeMc() : void
      {
         if(Boolean(this.bloodMc) && this.bloodMc.parent != null)
         {
            this.bloodMc.stop();
            this.bloodMc.parent.removeChild(this.bloodMc);
         }
      }
      
      public function setShuxingJiacheng(param1:String, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param1 + "</font>";
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
            if(param2 >= this.CANHEZHI_MAX)
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
            if(this.duomingshisanjian.x == 138)
            {
               TweenMax.to(this.duomingshisanjian,1,{"x":410});
               this.tupoBo = true;
               this.shangyiyeButton.enabled = false;
               this.xiayiyeButton.enabled = false;
               this.tishengBtn.enabled = false;
            }
         }
         else
         {
            if(this.duomingshisanjian.x == 410)
            {
               TweenMax.to(this.duomingshisanjian,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUOMINGSHISANJIAN_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.shangyiyeButton.enabled = true;
            this.xiayiyeButton.enabled = true;
            this.tishengBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            if(this.lookingId >= this.CANHEZHI_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.duomingshisanjian.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.duomingshisanjian.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.duomingshisanjian.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.duomingshisanjian.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.duomingshisanjian.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.shangyiyeButton.enabled = false;
         this.xiayiyeButton.enabled = false;
         this.tishengBtn.enabled = false;
      }
   }
}

