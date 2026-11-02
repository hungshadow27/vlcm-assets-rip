package com.tgame.shell.view.components.aojianzhuansheng
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.item.Skill;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class AoJianZhuanShengPanel extends FPanel
   {
      
      public static const UI_AOJIANZHUANSHENG_ZHUANSHENG_CLICK:String = "UI_AOJIANZHUANSHENG_ZHUANSHENG_CLICK";
      
      public static const UI_AOJIANZHUANSHENG_ZHULING_CLICK:String = "UI_AOJIANZHUANSHENG_ZHULING_CLICK";
      
      private var miaoshu:FTextArea;
      
      private var zhuanshengBtn:NewSkinButton;
      
      private var tiaojian:FTextArea;
      
      private var zhuanshengdengji:FTextArea;
      
      private var shuxing:FTextArea;
      
      private var shuxingTl:FTextArea;
      
      private var zhulingBtn:NewSkinButton;
      
      private var starSpr:Sprite;
      
      private var xiaohao:FTextArea;
      
      private var valueSpr:Sprite;
      
      private var kuang:Bitmap;
      
      private var kuang2:Bitmap;
      
      private var jinengSpr:Sprite;
      
      private var _avatar:Bitmap;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var yizhuanBg:DisplayObject;
      
      private var shuoMingCanvas:FCanvas;
      
      private var txt1:FTextArea;
      
      private var txt2:FTextArea;
      
      private var txt3:FTextArea;
      
      private var txt4:FTextArea;
      
      private var txt5:FTextArea;
      
      private var txt6:FTextArea;
      
      private var txt7:FTextArea;
      
      private var txt8:FTextArea;
      
      private var txt9:FTextArea;
      
      public function AoJianZhuanShengPanel()
      {
         var ft:FTextArea;
         var bg1:DisplayObject = null;
         super();
         this.titleText = "傲剑转生";
         this.showCloseButton = true;
         this.skin = "panel";
         this.dragAble = true;
         width = 634 + 85;
         height = 440 + 80;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/attribute/bg.swf");
         bg1.x = 10;
         bg1.y = 2;
         addChild(bg1);
         bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/attribute/wenzi.swf");
         bg1.x = 42;
         bg1.y = 42;
         addChild(bg1);
         bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/attribute/jiantou.swf");
         bg1.x = 337 + 12;
         bg1.y = 337 + 34;
         addChild(bg1);
         this.miaoshu = new FTextArea();
         this.miaoshu.wordWrap = true;
         this.miaoshu.filters = StaticValue.filter;
         this.miaoshu.x = 40;
         this.miaoshu.y = 40;
         this.miaoshu.width = 180;
         this.miaoshu.height = 120;
         this.miaoshu.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>转生说明</font>";
         this.tiaojian = new FTextArea();
         this.tiaojian.wordWrap = true;
         this.tiaojian.filters = StaticValue.filter;
         this.tiaojian.x = 40 + 25 + 36;
         this.tiaojian.y = 240 + 75 + 59 - 3;
         this.tiaojian.width = 180;
         this.tiaojian.height = 120;
         addChild(this.tiaojian);
         this.tiaojian.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>条件</font>";
         this.zhuanshengdengji = new FTextArea();
         this.zhuanshengdengji.wordWrap = true;
         this.zhuanshengdengji.filters = StaticValue.filter;
         this.zhuanshengdengji.x = 300;
         this.zhuanshengdengji.y = 240;
         this.zhuanshengdengji.width = 180;
         this.zhuanshengdengji.height = 120;
         this.zhuanshengdengji.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>1转</font>";
         this.starSpr = new Sprite();
         this.starSpr.x = 10;
         this.starSpr.y = 350 + 70;
         addChild(this.starSpr);
         this.shuxingTl = new FTextArea();
         this.shuxingTl.x = 600;
         this.shuxingTl.y = 30;
         this.shuxingTl.textColor = StaticValue.GREEN;
         this.shuxingTl.width = 200;
         this.shuxingTl.height = 20;
         this.shuxingTl.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'><u>属性图例</u></font>";
         addChild(this.shuxingTl);
         this.shuxingTl.addEventListener(MouseEvent.CLICK,this.onClick);
         ToolTips.createToolTips(this.shuxingTl,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "点击可查看属性图例<br>" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.shuxing = new FTextArea();
         this.shuxing.x = 450 + 141;
         this.shuxing.y = 70 + 23;
         this.shuxing.textColor = StaticValue.GREEN;
         this.shuxing.autoSize = TextFieldAutoSize.LEFT;
         addChild(this.shuxing);
         this.valueSpr = new Sprite();
         this.valueSpr.x = this.shuxing.x + this.shuxing.width + 10;
         this.valueSpr.y = this.shuxing.y;
         addChild(this.valueSpr);
         this.xiaohao = new FTextArea();
         this.xiaohao.x = 550 + 121;
         this.xiaohao.y = 390 + 65;
         this.xiaohao.textColor = StaticValue.GREEN;
         this.xiaohao.width = 200;
         this.xiaohao.height = 20;
         this.xiaohao.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>消耗天灵</font>";
         addChild(this.xiaohao);
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 325 + 33 - 67;
         this.jinengSpr.y = 300 + 20 + 45;
         addChild(this.jinengSpr);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 2 + 6 + 234;
         this.bloodMcSpr.y = 2 - 10 + 44;
         addChild(this.bloodMcSpr);
         this.mcObj = new Array();
         this._avatar = new Bitmap();
         addChild(this._avatar);
         this.zhuanshengBtn = new NewSkinButton();
         this.zhuanshengBtn.skin = "ajzs_zhuansheng_Button";
         this.zhuanshengBtn.x = 80;
         this.zhuanshengBtn.y = 125 + 110;
         addChild(this.zhuanshengBtn);
         this.zhuanshengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zhulingBtn = new NewSkinButton();
         this.zhulingBtn.skin = "ajzs_zhuling_Button";
         this.zhulingBtn.x = 540 + 67 - 12;
         this.zhulingBtn.y = 350 + 70;
         addChild(this.zhulingBtn);
         this.zhulingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shuoMingCanvas = new FCanvas();
         this.shuoMingCanvas.skin = "menuBg";
         this.shuoMingCanvas.width = 165 + 15;
         this.shuoMingCanvas.height = 250 - 110 + 375;
         ft = new FTextArea();
         ft.width = 193;
         ft.height = 500;
         ft.x = 20;
         ft.y = 20;
         ft.textColor = StaticValue.YELLOW;
         ft.filters = StaticValue.filter;
         ft.htmlText = "<font >" + "数字单位图例" + "<br>" + "1K=1,000=1千" + "<br>" + "1M=1,000K=1百万" + "<br>" + "1T=1,000000M=1后面12个0" + "<br>" + "1aa=1,000T=1后面15个0" + "<br>" + "1bb=1,000aa=1后面18个0" + "<br>" + "1cc=1,000bb=1后面21个0" + "<br>" + "1dd=1,000cc=1后面24个0" + "<br>" + "1ee=1,000dd=1后面27个0" + "<br>" + "1ff=1,000ee=1后面30个0" + "<br>" + "1gg=1,000ff=1后面33个0" + "<br>" + "1hh=1,000gg=1后面36个0" + "<br>" + "1ii=1,000hh=1后面39个0" + "<br>" + "1jj=1,000ii=1后面42个0" + "<br>" + "1kk=1,000jj=1后面45个0" + "<br>" + "1ll=1,000kk=1后面48个0" + "<br>" + "1mm=1,000ll=1后面51个0" + "<br>" + "1nn=1,000mm=1后面54个0" + "<br>" + "1oo=1,000nn=1后面57个0" + "<br>" + "1pp=1,000oo=1后面60个0" + "<br>" + "1qq=1,000pp=1后面63个0" + "<br>" + "1rr=1,000qq=1后面66个0" + "<br>" + "1ss=1,000rr=1后面69个0" + "<br>" + "1tt=1,000ss=1后面72个0" + "<br>" + "1uu=1,000tt=1后面75个0" + "<br>" + "1vv=1,000uu=1后面78个0" + "<br>" + "1ww=1,000vv=1后面81个0" + "<br>" + "1xx=1,000ww=1后面84个0" + "<br>" + "1yy=1,000xx=1后面87个0" + "<br>" + "1zz=1,000yy=1后面90个0" + "<br>" + "</font>";
         this.shuoMingCanvas.addChild(ft);
         this.txt1 = new FTextArea();
         this.txt1.x = 252;
         this.txt1.y = 40;
         this.txt1.textColor = StaticValue.GREEN;
         this.txt1.width = 90;
         this.txt1.height = 20;
         this.txt1.htmlText = "红宝石（仙魔）";
         this.txt1.visible = false;
         addChild(this.txt1);
         ToolTips.createToolTips(this.txt1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "红宝石：可增加100%全属性。" + "<br>" + "特殊属性：攻击400888亿、防御320888亿、血量320888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt2 = new FTextArea();
         this.txt2.x = 252;
         this.txt2.y = 58;
         this.txt2.textColor = StaticValue.GREEN;
         this.txt2.width = 90;
         this.txt2.height = 20;
         this.txt2.htmlText = "黄玛瑙（仙魔）";
         this.txt2.visible = false;
         addChild(this.txt2);
         ToolTips.createToolTips(this.txt2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "黄玛瑙：可增加100%全属性。" + "<br>" + "特殊属性：攻击400888亿、防御320888亿、血量320888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt3 = new FTextArea();
         this.txt3.x = 252;
         this.txt3.y = 76;
         this.txt3.textColor = StaticValue.GREEN;
         this.txt3.width = 90;
         this.txt3.height = 20;
         this.txt3.htmlText = "绿翡翠（仙魔）";
         this.txt3.visible = false;
         addChild(this.txt3);
         ToolTips.createToolTips(this.txt3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "绿翡翠：可增加100%全属性。" + "<br>" + "特殊属性：攻击400888亿、防御320888亿、血量320888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt4 = new FTextArea();
         this.txt4.x = 252;
         this.txt4.y = 94;
         this.txt4.textColor = StaticValue.GREEN;
         this.txt4.width = 90;
         this.txt4.height = 20;
         this.txt4.htmlText = "流水若止石";
         this.txt4.visible = false;
         addChild(this.txt4);
         ToolTips.createToolTips(this.txt4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "双击使用可增加人物全属性1000%。（限10次）" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt5 = new FTextArea();
         this.txt5.x = 252;
         this.txt5.y = 112;
         this.txt5.textColor = StaticValue.GREEN;
         this.txt5.width = 90;
         this.txt5.height = 20;
         this.txt5.htmlText = "无痕旧梦石";
         this.txt5.visible = false;
         addChild(this.txt5);
         ToolTips.createToolTips(this.txt5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "双击使用可增加人物全属性2000%。（限10次）" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt6 = new FTextArea();
         this.txt6.x = 252;
         this.txt6.y = 130;
         this.txt6.textColor = StaticValue.GREEN;
         this.txt6.width = 90;
         this.txt6.height = 20;
         this.txt6.htmlText = "幻灵寂凉石";
         this.txt6.visible = false;
         addChild(this.txt6);
         ToolTips.createToolTips(this.txt6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "双击使用可增加人物全属性2000%。（限10次）" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt7 = new FTextArea();
         this.txt7.x = 252;
         this.txt7.y = 148;
         this.txt7.textColor = StaticValue.GREEN;
         this.txt7.width = 90;
         this.txt7.height = 20;
         this.txt7.htmlText = "冥梦惘然石";
         this.txt7.visible = false;
         addChild(this.txt7);
         ToolTips.createToolTips(this.txt7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "双击使用可增加人物全属性5000%。（限10次）" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt8 = new FTextArea();
         this.txt8.x = 252;
         this.txt8.y = 166;
         this.txt8.textColor = StaticValue.GREEN;
         this.txt8.width = 90;
         this.txt8.height = 20;
         this.txt8.htmlText = "剑心舞韵石";
         this.txt8.visible = false;
         addChild(this.txt8);
         ToolTips.createToolTips(this.txt8,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "双击使用可增加人物全属性5000%。（限10次）" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt9 = new FTextArea();
         this.txt9.x = 252;
         this.txt9.y = 184;
         this.txt9.textColor = StaticValue.GREEN;
         this.txt9.width = 90;
         this.txt9.height = 20;
         this.txt9.htmlText = "永恒天灵石";
         this.txt9.visible = false;
         addChild(this.txt9);
         ToolTips.createToolTips(this.txt9,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "双击使用可增加人物全属性10000%。（限100次）" + "<br>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
         if(Boolean(this.shuoMingCanvas) && Boolean(this.shuoMingCanvas.parent))
         {
            this.shuoMingCanvas.parent.removeChild(this.shuoMingCanvas);
         }
      }
      
      private function setBg(param1:int) : void
      {
         var mcId:int = 0;
         var loadUrl:String = null;
         var id:int = param1;
         mcId = id;
         loadUrl = GameConfig.fileBaseFolder + "res/ui/attribute/bg" + mcId + ".swf";
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
               bloodMc = _loc2_.content as MovieClip;
               mcObj[mcId] = bloodMc;
               if(bloodMc)
               {
                  bloodMcSpr.addChild(bloodMc);
               }
            },null,false,loadUrl);
         }
         this.yizhuanBg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/attribute/" + mcId + ".swf");
         this.yizhuanBg.x = 330 - 234;
         this.yizhuanBg.y = 312 + 29 - 44;
         this.bloodMcSpr.addChild(this.yizhuanBg);
      }
      
      public function avatar(param1:BitmapData) : void
      {
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         this._avatar.x = 320 - this._avatar.width / 2 + 50;
         this._avatar.y = 200 - this._avatar.height + 90;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.zhuanshengBtn:
               dispatchEvent(new BaseEvent(UI_AOJIANZHUANSHENG_ZHUANSHENG_CLICK));
               break;
            case this.zhulingBtn:
               dispatchEvent(new BaseEvent(UI_AOJIANZHUANSHENG_ZHULING_CLICK));
               break;
            case this.shuxingTl:
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
                  this.shuoMingCanvas.x = 415 + 305;
                  this.shuoMingCanvas.y = 30 - 60;
               }
         }
      }
      
      public function setSkill(param1:int, param2:int) : void
      {
         var _loc3_:FTextArea = null;
         var _loc4_:Skill = null;
         var _loc5_:ItemFace = null;
         while(this.jinengSpr.numChildren > 0)
         {
            this.jinengSpr.removeChildAt(0);
         }
         if(param1 == 0)
         {
            _loc3_ = new FTextArea();
            _loc3_.wordWrap = true;
            _loc3_.filters = StaticValue.filter;
            _loc3_.x = 10;
            _loc3_.y = 10;
            _loc3_.width = 20;
            _loc3_.height = 20;
            this.jinengSpr.addChild(_loc3_);
            _loc3_.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>无</font>";
         }
         else
         {
            _loc4_ = new Skill(param1);
            _loc4_.isLearn = 1;
            _loc5_ = new ItemFace(_loc4_);
            _loc5_.showKungFuTag();
            _loc5_.setShowCount(false);
            this.jinengSpr.addChild(_loc5_);
         }
         if(param2 == 0)
         {
            _loc3_ = new FTextArea();
            _loc3_.wordWrap = true;
            _loc3_.filters = StaticValue.filter;
            _loc3_.x = 10 + 120;
            _loc3_.y = 10;
            _loc3_.width = 20;
            _loc3_.height = 20;
            this.jinengSpr.addChild(_loc3_);
            _loc3_.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>无</font>";
         }
         else
         {
            _loc4_ = new Skill(param2);
            _loc4_.isLearn = 1;
            _loc5_ = new ItemFace(_loc4_);
            _loc5_.x = 120;
            _loc5_.showKungFuTag();
            _loc5_.setShowCount(false);
            this.jinengSpr.addChild(_loc5_);
         }
      }
      
      public function setPanel(param1:String, param2:int, param3:Number, param4:Boolean, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int) : void
      {
         this.tiaojian.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + param2 + "级<br>" + param3 + "亿</font>";
         this.zhuanshengBtn.enabled = param4;
         this.setSkill(param7,param8);
         this.xiaohao.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + param9 + "</font>";
         var _loc11_:Player = GameInstance.mainCharData;
         var _loc12_:AttributeInfo = _loc11_.attributeInfo;
         this.setSkillValue(_loc12_.ap,_loc12_.dp,_loc12_.cp,_loc12_.ev,_loc12_.adx,_loc12_.mdx,_loc12_.hpMax,_loc12_.mpMax,_loc12_.ppMax);
         this.setStar(param10);
         this.setBg(param5);
         if(param6 == 8)
         {
            this.tiaojian.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>当前已是最高阶<br>当前已是最高阶</font>";
         }
         if(param10 == 10)
         {
            this.zhulingBtn.enabled = false;
         }
         else
         {
            this.zhulingBtn.enabled = true;
         }
         this.txt1.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_HONGBAOSHI];
         this.txt2.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_HUANGMANAO];
         this.txt3.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_LVFEICUI];
         this.txt4.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_SHITOU01];
         this.txt5.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_SHITOU02];
         this.txt6.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_SHITOU03];
         this.txt7.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_SHITOU04];
         this.txt8.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_SHITOU05];
         this.txt9.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_SHITOU06];
      }
      
      private function setStar(param1:int) : void
      {
         var _loc3_:DisplayObject = null;
         while(this.starSpr.numChildren > 0)
         {
            this.starSpr.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < 10)
         {
            if(_loc2_ < param1)
            {
               _loc3_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/attribute/liang.swf");
               _loc3_.x = _loc2_ * 57;
               this.starSpr.addChild(_loc3_);
            }
            else
            {
               _loc3_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/attribute/an.swf");
               _loc3_.x = _loc2_ * 57;
               this.starSpr.addChild(_loc3_);
            }
            _loc2_++;
         }
      }
      
      public function setSkillValue(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         this.shuxing.htmlText = "<textformat leading=\'12\'>" + "" + this.setZhuanSheng(param7)[0] + "<br>" + "" + this.setZhuanSheng(param8)[0] + "<br>" + "" + this.setZhuanSheng(param9)[0] + "<br>" + "" + this.setZhuanSheng(param1)[0] + "<br>" + "" + this.setZhuanSheng(param2)[0] + "<br>" + "" + this.setZhuanSheng(param3)[0] + "<br>" + "" + this.setZhuanSheng(param4)[0] + "<br><br>" + "" + this.setZhuanSheng(param5)[0] + "<br>" + "" + this.setZhuanSheng(param6)[0] + "<br></font></textformat>";
         this.valueSpr.x = this.shuxing.x + this.shuxing.width + 10;
         var _loc10_:Array = [this.setZhuanSheng(param7)[1],this.setZhuanSheng(param8)[1],this.setZhuanSheng(param9)[1],this.setZhuanSheng(param1)[1],this.setZhuanSheng(param2)[1],this.setZhuanSheng(param3)[1],this.setZhuanSheng(param4)[1],this.setZhuanSheng(param5)[1],this.setZhuanSheng(param6)[1]];
         this.setDanwei(_loc10_);
      }
      
      private function setDanwei(param1:Array) : void
      {
         var _loc3_:DisplayObject = null;
         while(this.valueSpr.numChildren > 0)
         {
            this.valueSpr.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            if(param1[_loc2_] != "无")
            {
               _loc3_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/attribute/" + param1[_loc2_] + ".swf");
               if(_loc2_ > 6)
               {
                  _loc2_ += 1;
               }
               _loc3_.y = _loc2_ * 24;
               this.valueSpr.addChild(_loc3_);
            }
            _loc2_++;
         }
      }
      
      public function setZhuanSheng(param1:Number) : Array
      {
         var _loc2_:Array = [];
         var _loc3_:Boolean = false;
         var _loc4_:Number = 0;
         if(param1 < 0)
         {
            _loc3_ = true;
            _loc4_ = Math.abs(param1);
         }
         else
         {
            _loc3_ = false;
            _loc4_ = param1;
         }
         var _loc5_:String = "1";
         var _loc6_:* = Math.floor(_loc4_);
         while(_loc6_ > 10)
         {
            _loc5_ += "1";
            _loc6_ /= 10;
         }
         var _loc7_:Number = Math.floor(_loc4_);
         if(_loc5_.length > 90)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,90)).toFixed(2),"zz"];
         }
         else if(_loc5_.length > 87)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,87)).toFixed(2),"yy"];
         }
         else if(_loc5_.length > 84)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,84)).toFixed(2),"xx"];
         }
         else if(_loc5_.length > 81)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,81)).toFixed(2),"ww"];
         }
         else if(_loc5_.length > 78)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,78)).toFixed(2),"vv"];
         }
         else if(_loc5_.length > 75)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,75)).toFixed(2),"uu"];
         }
         else if(_loc5_.length > 72)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,72)).toFixed(2),"tt"];
         }
         else if(_loc5_.length > 69)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,69)).toFixed(2),"ss"];
         }
         else if(_loc5_.length > 66)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,66)).toFixed(2),"rr"];
         }
         else if(_loc5_.length > 63)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,63)).toFixed(2),"qq"];
         }
         else if(_loc5_.length > 60)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,60)).toFixed(2),"pp"];
         }
         else if(_loc5_.length > 57)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,57)).toFixed(2),"oo"];
         }
         else if(_loc5_.length > 54)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,54)).toFixed(2),"nn"];
         }
         else if(_loc5_.length > 51)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,51)).toFixed(2),"mm"];
         }
         else if(_loc5_.length > 48)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,48)).toFixed(2),"ll"];
         }
         else if(_loc5_.length > 45)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,45)).toFixed(2),"kk"];
         }
         else if(_loc5_.length > 42)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,42)).toFixed(2),"jj"];
         }
         else if(_loc5_.length > 39)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,39)).toFixed(2),"ii"];
         }
         else if(_loc5_.length > 36)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,36)).toFixed(2),"hh"];
         }
         else if(_loc5_.length > 33)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,33)).toFixed(2),"gg"];
         }
         else if(_loc5_.length > 30)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,30)).toFixed(2),"ff"];
         }
         else if(_loc5_.length > 27)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,27)).toFixed(2),"ee"];
         }
         else if(_loc5_.length > 24)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,24)).toFixed(2),"dd"];
         }
         else if(_loc5_.length > 21)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,21)).toFixed(2),"cc"];
         }
         else if(_loc5_.length > 18)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,18)).toFixed(2),"bb"];
         }
         else if(_loc5_.length > 15)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,15)).toFixed(2),"aa"];
         }
         else if(_loc5_.length > 12)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,12)).toFixed(2),"T"];
         }
         else if(_loc5_.length > 6)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,6)).toFixed(2),"M"];
         }
         else if(_loc5_.length > 3)
         {
            _loc2_ = [(_loc7_ / Math.pow(10,3)).toFixed(2),"K"];
         }
         else
         {
            _loc2_ = [_loc7_,"无"];
         }
         if(_loc3_)
         {
            _loc2_[0] = -_loc2_[0];
         }
         return _loc2_;
      }
   }
}

