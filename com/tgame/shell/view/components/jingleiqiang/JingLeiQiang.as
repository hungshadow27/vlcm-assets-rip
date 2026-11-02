package com.tgame.shell.view.components.jingleiqiang
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.jingleiqiang.model.info.JingLeiQiangVo;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import gs.TweenMax;
   
   public class JingLeiQiang extends Sprite
   {
      
      public static const UI_JINGLEIQIANG_GUANBI_CLICK:String = "UI_JINGLEIQIANG_GUANBI_CLICK";
      
      private var bg:DisplayObject;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var tishengBtn:SecondButton;
      
      private var shuomingBtn:SecondButton;
      
      private var shuxing:FTextArea;
      
      private var shuxingY:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var jingleiqiang:JingLeiQiangTupoCanvas;
      
      private var _$parent:DisplayObject;
      
      private var bg1:DisplayObject;
      
      public const JINGLEIQIANG_MAX:int = 7;
      
      private var shuoMingCanvas:FCanvas;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var kuang:Bitmap;
      
      private var jinengSpr:Sprite;
      
      private var tf:TextFormat;
      
      private var isMain:Boolean = false;
      
      private var bg1Spr:Sprite;
      
      private var bg2Spr:Sprite;
      
      private var bg3Spr:Sprite;
      
      private var bg4Spr:Sprite;
      
      private var bg5Spr:Sprite;
      
      private var bg6Spr:Sprite;
      
      private var bg7Spr:Sprite;
      
      private var bg8Spr:Sprite;
      
      private var boll1:DisplayObject;
      
      private var boll2:DisplayObject;
      
      private var boll3:DisplayObject;
      
      private var boll4:DisplayObject;
      
      private var boll5:DisplayObject;
      
      private var boll6:DisplayObject;
      
      private var boll7:DisplayObject;
      
      private var boll8:DisplayObject;
      
      private var boll:DisplayObject;
      
      private var riyin:MovieClip;
      
      private var xianShiBtn:NewSkinButton;
      
      private var xianBoo:Boolean = false;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var checkHz:FCheckBox;
      
      private var fts3:FTextArea;
      
      private var suipian:int = 0;
      
      private var checkDt:FCheckBox;
      
      private var fts4:FTextArea;
      
      private var checkZq:FCheckBox;
      
      public function JingLeiQiang()
      {
         var fjjn:FTextArea;
         var $mask:Sprite;
         var box:FCanvas = null;
         var title:FTextArea = null;
         var loadUrl1:String = null;
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
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/jingleiqiang/bg.swf");
         this.bg1.x = 2;
         this.bg1.y = 234;
         addChild(this.bg1);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 2;
         this.bloodMcSpr.y = 2;
         addChild(this.bloodMcSpr);
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         this.shangyiyeButton.x = 240 + 50 - 45 - 16 - 116 + 37;
         this.shangyiyeButton.y = 205 + 25 - 20 + 25 - 10 - 17 + 55;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.background = true;
         this.cengshu.backgroundColor = 1186072;
         this.cengshu.width = 59;
         this.cengshu.height = 17;
         this.cengshu.x = 170;
         this.cengshu.y = 230 - 20 + 25 - 10 - 17 + 55;
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         this.xiayiyeButton.x = 240 + 50 - 45 - 16;
         this.xiayiyeButton.y = 205 + 25 - 20 + 25 - 10 - 17 + 55;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.xianShiBtn = new NewSkinButton();
         this.xianShiBtn.skin = "jingLeiQiangButton_1";
         addChild(this.xianShiBtn);
         this.xianShiBtn.x = 115;
         this.xianShiBtn.y = 200;
         this.xianShiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shuoMingCanvas = new FCanvas();
         this.shuoMingCanvas.skin = "menuBg";
         this.shuoMingCanvas.width = 165;
         this.shuoMingCanvas.height = 250 - 190;
         title = new FTextArea();
         title.multiline = true;
         title.filters = StaticValue.filter;
         title.width = 100;
         title.height = 110;
         title.x = 70;
         title.y = 240 + 10;
         title.textColor = StaticValue.ORANGE;
         this.miaoshu = new FTextArea();
         this.shuoMingCanvas.addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 160;
         this.miaoshu.height = 110 + 20;
         this.miaoshu.x = 5;
         this.miaoshu.y = 5;
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("江湖绝技，使用后，可立即解除自身大部分减益状态。纵横江湖，自在逍遥，必备神技。") + "</font>";
         this.shuxing = new FTextArea();
         this.shuxing.multiline = true;
         this.shuxing.filters = StaticValue.filter;
         this.shuxing.width = 125;
         this.shuxing.height = 110;
         this.shuxing.x = 284;
         this.shuxing.y = 244;
         this.shuxing.textColor = StaticValue.ORANGE;
         addChild(this.shuxing);
         this.shuxingY = new FTextArea();
         this.shuxingY.multiline = true;
         this.shuxingY.filters = StaticValue.filter;
         this.shuxingY.width = 100 + 100;
         this.shuxingY.height = 110;
         this.shuxingY.x = 75;
         this.shuxingY.y = 330;
         this.shuxingY.textColor = StaticValue.ORANGE;
         this.shuxingY.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("七色光辉，变幻莫测，尽显旷世神力") + "</font>";
         addChild(this.shuxingY);
         this.tishengBtn = new SecondButton();
         addChild(this.tishengBtn);
         this.tishengBtn.x = 286;
         this.tishengBtn.y = 205 + 25 - 20 + 25 - 10 - 17 + 50 + 80;
         this.tishengBtn.label = LanResManager.getLanCommonTextWords("神兵锻造");
         this.tishengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         fjjn = new FTextArea();
         fjjn.multiline = true;
         fjjn.filters = StaticValue.filter;
         fjjn.width = 80;
         fjjn.height = 20;
         fjjn.x = 10;
         fjjn.y = 345;
         fjjn.textColor = StaticValue.ORANGE;
         fjjn.htmlText = "<textformat leading=\'50\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("神兵技能") + "</font></textformat>";
         addChild(fjjn);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 16;
         this.kuang.y = 307;
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 16 + 2;
         this.jinengSpr.y = 307 + 2;
         addChild(this.jinengSpr);
         this.shuomingBtn = new SecondButton();
         addChild(this.shuomingBtn);
         this.shuomingBtn.x = 286;
         this.shuomingBtn.y = 210;
         this.shuomingBtn.label = LanResManager.getLanCommonTextWords("神器介绍");
         this.shuomingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.jingleiqiang = new JingLeiQiangTupoCanvas();
         addChild(this.jingleiqiang);
         this.jingleiqiang.x = 138;
         this.jingleiqiang.y = 0;
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
         this.jingleiqiang.mask = $mask;
         addEventListener(UI_JINGLEIQIANG_GUANBI_CLICK,this.onCloseTupo);
         this.mcObj = new Array();
         this.bg1Spr = new Sprite();
         this.bg2Spr = new Sprite();
         this.bg3Spr = new Sprite();
         this.bg4Spr = new Sprite();
         this.bg5Spr = new Sprite();
         this.bg6Spr = new Sprite();
         this.bg7Spr = new Sprite();
         this.bg1Spr.x = 10;
         this.bg1Spr.y = 270;
         addChild(this.bg1Spr);
         this.bg2Spr.x = 50;
         this.bg2Spr.y = 260;
         addChild(this.bg2Spr);
         this.bg3Spr.x = 90;
         this.bg3Spr.y = 245;
         addChild(this.bg3Spr);
         this.bg4Spr.x = 132;
         this.bg4Spr.y = 262;
         addChild(this.bg4Spr);
         this.bg5Spr.x = 160;
         this.bg5Spr.y = 290;
         addChild(this.bg5Spr);
         this.bg6Spr.x = 200;
         this.bg6Spr.y = 280;
         addChild(this.bg6Spr);
         this.bg7Spr.x = 222;
         this.bg7Spr.y = 248;
         addChild(this.bg7Spr);
         loadUrl1 = GameConfig.fileBaseFolder + "res/data/mc/yuejinlun/taiyang.swf";
         this.riyin = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl1)
            {
               return;
            }
            riyin = _loc2_.content as MovieClip;
            if(riyin)
            {
               riyin.visible = true;
               riyin.play();
               riyin.x = -7;
               riyin.y = -5;
            }
         },null,false,loadUrl1);
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 110;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("七色神石");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("七色神石：七道彩光，七种神力。") + "<br>" + LanResManager.getLanCommonTextWords("攻击12888888889000 防御10888888889000所有武功3000000层 攻击速度+488") + "<br>" + LanResManager.getLanCommonTextWords("特殊技能：①、每次攻击必定能对对手造成70%的血量伤害；") + "<br>" + LanResManager.getLanCommonTextWords("②、每次受到的负面状态都能复制该状态，并将此状态反噬给对手；") + "<br>" + LanResManager.getLanCommonTextWords("③、每攻击对手20次，都将瞬间清除自身随机20个负面状态。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 7 + 25;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 110;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("屠龙勇士");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击12888888889000 防御10888888889000 血量13888888889000") + "<br>" + LanResManager.getLanCommonTextWords("暴击 88888闪避 88888所有武功3000000层") + "<br>" + LanResManager.getLanCommonTextWords("屠龙勇士：激活后可获得屠龙勇士外观，人物可自由切换。") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：攻击时100%触发屠龙勇士，持续10秒；在此状态下，自身展翅起飞，飞上空中，从对手视野") + "<br>" + LanResManager.getLanCommonTextWords("中消失，持续5秒；且当自身从空中落下时会对以身上为中心的5格范围内对手造成80%血量伤害且眩晕5") + "<br>" + LanResManager.getLanCommonTextWords("秒；且屠龙勇士落地后，神盾护体能抵抗对手的100次进攻伤害。冷却60秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkHz = new FCheckBox();
         addChild(this.checkHz);
         this.checkHz.visible = false;
         this.checkHz.x = 80;
         this.checkHz.y = 7 + 25;
         this.checkHz.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 7 + 25 * 2;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 110;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("皎月女神");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击10888888889000 防御8888888889000 血量12888888889000") + "<br>" + LanResManager.getLanCommonTextWords("暴击88888闪避88888 所有武功2800000层") + "<br>" + LanResManager.getLanCommonTextWords("皎月女神：攻击时几率触发皎月女神，持续10秒；在此状态下，每次攻击会在对手身上标记一个月光印记，") + "<br>" + LanResManager.getLanCommonTextWords("对手在印记状态下，被皎月女神锁定无法隐身；且在此状态下，皎月女神召唤3个月亮魂在自身周围环绕，") + "<br>" + LanResManager.getLanCommonTextWords("3个月亮魂拥有与自身相同的血量，对手需先打破月亮魂才能攻击自身；当状态解除时，皎月女神会将对手") + "<br>" + LanResManager.getLanCommonTextWords("瞬间吸回自身旁边且受到80%的血量伤害。") + "<br>" + LanResManager.getLanCommonTextWords("特殊效果：激活皎月女神后，将开启皎月女神隐藏属性，可使用皎月碎片对该隐藏属性进行养成，每次增加") + "<br>" + LanResManager.getLanCommonTextWords("攻击1500亿，所有武功350000层。（最多可养成200次）。") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + suipian + LanResManager.getLanCommonTextWords("颗皎月碎片") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + suipian * 1500 + LanResManager.getLanCommonTextWords("亿，所有武功") + suipian * 350000 + LanResManager
            .getLanCommonTextWords("层") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkDt = new FCheckBox();
         addChild(this.checkDt);
         this.checkDt.visible = false;
         this.checkDt.x = 80;
         this.checkDt.y = 7 + 25 * 2;
         this.checkDt.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 7 + 25 * 3;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 110;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("紫金灵兽");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击10888888889000 防御8888888889000 血量12888888889000") + "<br>" + LanResManager.getLanCommonTextWords("暴击88888闪避88888 所有武功2800000层") + "<br>" + LanResManager.getLanCommonTextWords("紫金灵兽：攻击时100%触发紫金灵兽，持续10秒；在此状态下，自身每攻击对手一次，都将瞬间") + "<br>" + LanResManager.getLanCommonTextWords("击退对手，且给对手附带一个紫元素在身上，持续8秒；且在此状态下，每次被对手攻击，会瞬间") + "<br>" + LanResManager.getLanCommonTextWords("反弹对手的伤害，且给对手附带一个金元素在身上。对手在此状态下，当紫元素数量大于金元素") + "<br>" + LanResManager.getLanCommonTextWords("时，对手将所有勋章技能失效；当紫元素数量小于金元素时，对手将无法触发无敌状态；当紫金") + "<br>" + LanResManager.getLanCommonTextWords("元素数量相同时，对手每秒掉血50%。冷却60秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkZq = new FCheckBox();
         addChild(this.checkZq);
         this.checkZq.visible = false;
         this.checkZq.x = 80;
         this.checkZq.y = 7 + 25 * 3;
         this.checkZq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkZq:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq.selectState,249]));
               break;
            case this.checkHz:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkHz.selectState,247]));
               break;
            case this.checkDt:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkDt.selectState,248]));
         }
      }
      
      private function onClick2(param1:MouseEvent) : void
      {
         if(!this.isMain)
         {
            return;
         }
         if(this.lookingId == int(param1.target.name))
         {
            return;
         }
         this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGLEIQIANG_NEXT_CLICK,"",int(param1.target.name)));
         this.showTuPoPanel(false);
      }
      
      private function onCloseTupo(param1:BaseEvent) : void
      {
         this.showTuPoPanel(false);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:Boolean = false;
         switch(param1.target)
         {
            case this.shuomingBtn:
               if(Boolean(this.shuoMingCanvas) && Boolean(this.shuoMingCanvas.parent))
               {
                  if(this.shuoMingCanvas.parent)
                  {
                     this.shuoMingCanvas.parent.removeChild(this.shuoMingCanvas);
                  }
               }
               else
               {
                  addChild(this.shuoMingCanvas);
                  this.shuoMingCanvas.x = 415;
                  this.shuoMingCanvas.y = 200;
               }
               break;
            case this.xianShiBtn:
               _loc2_ = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[_loc2_,45]));
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGLEIQIANG_XIANSHI_CLICK,"",[this.lookingId,this.xianBoo]));
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGLEIQIANG_NEXT_CLICK,"",this.lookingId));
               break;
            case this.tishengBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGLEIQIANG_TUPO_CLICK,"",this.lookingId));
               this.showTuPoPanel(true);
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.jingleiqiang._parent2 = param1;
         this.jingleiqiang._parent3 = this;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:JingLeiQiangVo) : void
      {
         this.isMain = param1;
         this.yuyidengji(param2.nowID);
         this.setBg(param2.nowLookingID);
         this.setShuxingJiacheng(param2.miaoshu,param2.act,param2.def,param2.hp,param2.baoji,param2.shanbi);
         this.setZhaoShiMsg(param2.nowLookingName,param2.nowLookingID,param2.nowID);
         this.setSkill(param2.skillid,param2.isLearn);
         if(param2.isWaiXian == param2.nowLookingID)
         {
            this.xianShiBtn.skin = "jingLeiQiangButton_0";
            this.xianBoo = false;
         }
         else
         {
            this.xianShiBtn.skin = "jingLeiQiangButton_1";
            this.xianBoo = true;
         }
         this.setJiHuo(param1);
         this.checkHz.selectState = param2.isHuanZhuang;
         this.checkDt.selectState = param2.isDanTian;
         this.checkZq.selectState = param2.isZuoQI;
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.JINGLEIQIANG_QISESHENSHI_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.JINGLEIQIANG_TULONGYONGSHI_ID];
            this.checkHz.visible = GameState.dictMainStatus[SpecialGoodsID.JINGLEIQIANG_TULONGYONGSHI_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.JINGLEIQIANG_JIAOYUENVSHEN_ID];
            this.suipian = GameState.dictMainStatus[SpecialGoodsID.JINGLEIQIANG_JIAOYUESUIPIAN_ID];
            this.checkDt.visible = GameState.dictMainStatus[SpecialGoodsID.JINGLEIQIANG_JIAOYUENVSHEN_ID];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.JINGLEIQIANG_ZIJINLINGSHOU_ID];
            this.checkZq.visible = GameState.dictMainStatus[SpecialGoodsID.JINGLEIQIANG_ZIJINLINGSHOU_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGLEIQIANG_QISESHENSHI_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGLEIQIANG_TULONGYONGSHI_ID];
            this.checkHz.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGLEIQIANG_TULONGYONGSHI_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGLEIQIANG_JIAOYUENVSHEN_ID];
            this.suipian = GameState.dictTargetStatus[SpecialGoodsID.JINGLEIQIANG_JIAOYUESUIPIAN_ID];
            this.checkDt.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGLEIQIANG_JIAOYUENVSHEN_ID];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGLEIQIANG_ZIJINLINGSHOU_ID];
            this.checkZq.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGLEIQIANG_ZIJINLINGSHOU_ID];
         }
      }
      
      private function setBg(param1:int) : void
      {
         var mcId:int = 0;
         var loadUrl:String = null;
         var lookId:int = param1;
         mcId = lookId;
         this.riyin.visible = true;
         this["bg" + String(lookId) + "Spr"].addChild(this.riyin);
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/jingleiqiang/bg" + mcId + ".swf";
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
      
      private function yuyidengji(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < 7)
         {
            if(this["boll" + String(_loc2_ + 1)])
            {
               if(this["boll" + String(_loc2_ + 1)].parent)
               {
                  this["boll" + String(_loc2_ + 1)].parent.removeChild(this["boll" + String(_loc2_ + 1)]);
               }
            }
            this["boll" + String(_loc2_ + 1)] = null;
            if(_loc2_ < param1)
            {
               this["boll" + String(_loc2_ + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/jingleiqiang/" + (_loc2_ + 1) + ".swf");
            }
            else
            {
               this["boll" + String(_loc2_ + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/jingleiqiang/an.swf");
            }
            this["bg" + String(_loc2_ + 1) + "Spr"].addChild(this["boll" + String(_loc2_ + 1)]);
            this["boll" + String(_loc2_ + 1)].visible = true;
            this["boll" + String(_loc2_ + 1)].name = String(_loc2_ + 1);
            this["boll" + String(_loc2_ + 1)].addEventListener(MouseEvent.CLICK,this.onClick2);
            _loc2_++;
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
            this.tishengBtn.label = LanResManager.getLanCommonTextWords("神兵锻造");
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
            if(param2 >= this.JINGLEIQIANG_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
            else
            {
               this.xiayiyeButton.enabled = true;
            }
            if(param2 < param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("已锻造");
               this.tishengBtn.enabled = false;
            }
            else if(param2 == param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("神兵锻造");
               this.tishengBtn.enabled = true;
            }
            else if(param2 > param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("不可锻造");
               this.tishengBtn.enabled = false;
            }
         }
         if(param2 <= param3)
         {
            this.xianShiBtn.enabled = true;
         }
         else
         {
            this.xianShiBtn.enabled = false;
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
            if(this.jingleiqiang.x == 138)
            {
               TweenMax.to(this.jingleiqiang,1,{"x":410});
               this.tupoBo = true;
               this.shangyiyeButton.enabled = false;
               this.xiayiyeButton.enabled = false;
               this.tishengBtn.enabled = false;
            }
         }
         else
         {
            if(this.jingleiqiang.x == 410)
            {
               TweenMax.to(this.jingleiqiang,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGLEIQIANG_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.shangyiyeButton.enabled = true;
            this.xiayiyeButton.enabled = true;
            this.tishengBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            if(this.lookingId >= this.JINGLEIQIANG_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.jingleiqiang.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.jingleiqiang.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.jingleiqiang.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.jingleiqiang.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.jingleiqiang.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.shangyiyeButton.enabled = false;
         this.xiayiyeButton.enabled = false;
         this.tishengBtn.enabled = false;
         this.xianShiBtn.enabled = false;
      }
   }
}

