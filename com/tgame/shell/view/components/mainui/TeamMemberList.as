package com.tgame.shell.view.components.mainui
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.shell.view.components.MainUI;
   import com.tgame.shell.view.components.TeamPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.*;
   
   public class TeamMemberList extends Sprite
   {
      
      private var addBtn:FSimpleButton;
      
      private var subBtn:FSimpleButton;
      
      private var container:Sprite;
      
      private var zhenfaSpr:Sprite;
      
      private var zhenfaBgSpr:Sprite;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var zhenfay:int;
      
      private var zhenfaName:String = "";
      
      private var isSame:Boolean = true;
      
      private var MouseZhenfaStr1:String;
      
      private var MouseZhenfaStr2:String;
      
      private var MouseZhenfaStr3:String;
      
      private var MouseZhenfaStr4:String;
      
      private var _parent:DisplayObject;
      
      private var menuCanvas:FCanvas;
      
      private var menuList:FList;
      
      private var partId:int;
      
      private var partName:String;
      
      private var title:Sprite;
      
      private var duiWuSpr:Sprite;
      
      private var duiWuId:int = 0;
      
      public function TeamMemberList()
      {
         var i:int = 0;
         var member:MainUIMember = null;
         super();
         visible = false;
         this.title = new Sprite();
         addChild(this.title);
         this.title.addChild(StaticValue.getBitmapByClassName("ui.main.team.title"));
         this.title.addEventListener(MouseEvent.MOUSE_DOWN,this.onDrag);
         this.title.addEventListener(MouseEvent.MOUSE_UP,this.onDrag);
         Tools.currentStage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMove);
         this.addBtn = new FSimpleButton();
         this.addBtn.skin = "sumButton";
         addChild(this.addBtn);
         this.addBtn.x = 142;
         this.addBtn.y = 1;
         this.addBtn.visible = false;
         this.addBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.subBtn = new FSimpleButton();
         this.subBtn.skin = "subButton";
         addChild(this.subBtn);
         this.subBtn.x = 142;
         this.subBtn.y = 1;
         this.subBtn.visible = true;
         this.subBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.container = new Sprite();
         addChild(this.container);
         this.container.y = 44;
         this.duiWuSpr = new Sprite();
         this.duiWuSpr.x = 170;
         addChild(this.duiWuSpr);
         ToolTips.createToolTips(this.duiWuSpr,this,function():String
         {
            var _loc1_:String = "";
            return getDuiWuTips();
         });
         this.zhenfaSpr = new Sprite();
         this.zhenfaSpr.buttonMode = true;
         addChild(this.zhenfaSpr);
         this.zhenfaSpr.y = 22;
         this.zhenfaSpr.addEventListener(MouseEvent.MOUSE_UP,this.onMouseTip1);
         this.zhenfaSpr.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.zhenfaSpr.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         this.zhenfaBgSpr = new Sprite();
         this.zhenfaSpr.addChild(this.zhenfaBgSpr);
         i = 0;
         while(i < 6)
         {
            member = new MainUIMember();
            member.addEventListener(MouseEvent.CLICK,this.onMouseTip1);
            member.MouseBg.addEventListener(MouseEvent.CLICK,this.onMouseTip2);
            this.menuCanvas = new FCanvas();
            this.menuCanvas.skin = "backGroud";
            this.menuList = new FList();
            this.menuList.skin = "menuList";
            this.menuCanvas.addChild(this.menuList);
            this.menuList.x = 2;
            this.menuList.y = 2;
            this.menuList.listWidth = 53;
            this.menuList.dataProvider = <list>
																<node label={LanResManager.getLanCommonTextWords("密聊")} id="1"/>
																 <node label={LanResManager.getLanCommonTextWords("查看")} id="2"/>
																 <node label={LanResManager.getLanCommonTextWords("交友")} id="3"/>
																 <node label={LanResManager.getLanCommonTextWords("交易")} id="4"/>
																 <node label={LanResManager.getLanCommonTextWords("帮邀")} id="6"/>
																 <node label={LanResManager.getLanCommonTextWords("看摊")} id="7"/>
																 <node label={LanResManager.getLanCommonTextWords("赠花")} id="8"/>
															</list>;
            this.menuList.addEventListener(MouseEvent.CLICK,this.onList);
            this.menuCanvas.width = this.menuList.width + 4;
            this.menuCanvas.height = this.menuList.height + 4;
            this.container.addChild(member);
            member.y = i * 44;
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
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.addBtn:
               this.addBtn.visible = false;
               this.subBtn.visible = true;
               this.container.visible = true;
               this.zhenfaSpr.visible = true;
               this.zhenfaBgSpr.visible = true;
               break;
            case this.subBtn:
               this.addBtn.visible = true;
               this.subBtn.visible = false;
               this.container.visible = false;
               this.zhenfaSpr.visible = false;
               this.zhenfaBgSpr.visible = false;
         }
      }
      
      private function onDrag(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_DOWN:
               startDrag(false,new Rectangle(0,0,Tools.currentStage.stageWidth - 166,Tools.currentStage.stageHeight - 180));
               this.cacheAsBitmap = true;
               param1.updateAfterEvent();
               break;
            case MouseEvent.MOUSE_UP:
               this.cacheAsBitmap = false;
               stopDrag();
         }
      }
      
      private function onMove(param1:Event) : void
      {
         if(Tools.currentStage.mouseX < 0 || Tools.currentStage.mouseX > Tools.currentStage.stageWidth || Tools.currentStage.mouseY < 0 || Tools.currentStage.mouseY > Tools.currentStage.stageHeight)
         {
            stopDrag();
         }
      }
      
      private function onMouseTip1(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_UP:
               EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_MYTEAM_ORDERBTN_CLICK));
               break;
            case MouseEvent.MOUSE_OVER:
               this.zhenfaSpr.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(this.zhenfaName != LanResManager.getLanCommonTextWords("无阵法"))
               {
                  this.showTip("<textformat leading=\'\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + this.MouseZhenfaStr1 + "<br></font>" + this.MouseZhenfaStr2 + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + this.MouseZhenfaStr3 + "<br></font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + this.MouseZhenfaStr4 + "<br></font></textformat>");
               }
               else
               {
                  this.showTip(LanResManager.getLanTextWords(this,"您的队伍当前没有开启任何阵法",[StaticValue.ORANGE_HTML,StaticValue.GREEN_HTML,StaticValue.ORANGE_HTML]));
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.zhenfaSpr.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
         }
      }
      
      private function onMouseTip2(param1:MouseEvent) : void
      {
         this.partId = param1.currentTarget.parent.id;
         this.partName = param1.currentTarget.parent.playerName.text;
         if(param1.type == MouseEvent.CLICK)
         {
            param1.stopPropagation();
            this.showMenu();
         }
         else
         {
            GameInstance.scene.sceneDispatchEvent(param1);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
      }
      
      private function showMenu() : void
      {
         Tools.currentStage.addChild(this.menuCanvas);
         this.menuCanvas.x = Tools.currentStage.mouseX;
         this.menuCanvas.y = Tools.currentStage.mouseY;
         Tools.currentStage.addEventListener(MouseEvent.CLICK,this.onStageClick);
      }
      
      private function onStageClick(param1:MouseEvent = null) : void
      {
         if(this.menuCanvas.parent != null)
         {
            this.menuCanvas.parent.removeChild(this.menuCanvas);
         }
         Tools.currentStage.removeEventListener(MouseEvent.CLICK,this.onStageClick);
      }
      
      private function onList(param1:MouseEvent) : void
      {
         this.onStageClick();
         this._parent.dispatchEvent(new BaseEvent(MainUI.CHAT_MENU_CLICK,"",[int(this.menuList.selectItem.id),this.partId,this.partName]));
      }
      
      public function setMember(param1:Array, param2:String = "", param3:int = 0) : void
      {
         var _loc4_:Bitmap = null;
         var _loc5_:int = 0;
         var _loc7_:MainUIMember = null;
         var _loc8_:DisplayObject = null;
         while(this.zhenfaSpr.numChildren > 0)
         {
            this.zhenfaSpr.removeChildAt(0);
         }
         this.zhenfaName = param2;
         switch(this.zhenfaName)
         {
            case LanResManager.getLanCommonTextWords("无阵法"):
            case "":
               _loc4_ = StaticValue.getBitmapByClassName("ui.main.team.zhenfa.bg");
               this.zhenfaSpr.addChild(_loc4_);
               _loc4_ = StaticValue.getBitmapByClassName("ui.main.team.zhenfa.title");
               this.zhenfaSpr.addChild(_loc4_);
               _loc4_.x = 33;
               this.zhenfay = 0;
               break;
            case LanResManager.getLanCommonTextWords("两仪阵"):
               _loc4_ = StaticValue.getBitmapByClassName("ui.main.team.zhenfa.liangyi");
               this.zhenfaSpr.addChild(_loc4_);
               this.zhenfay = 9;
               this.MouseZhenfaStr1 = LanResManager.getLanCommonTextWords("两仪阵");
               this.MouseZhenfaStr3 = LanResManager.getLanTextWords(this,"两仪阵开启条件");
               this.MouseZhenfaStr4 = LanResManager.getLanTextWords(this,"两仪阵阵法效果");
               break;
            case LanResManager.getLanCommonTextWords("三才阵"):
               _loc4_ = StaticValue.getBitmapByClassName("ui.main.team.zhenfa.sancai");
               this.zhenfaSpr.addChild(_loc4_);
               this.zhenfay = 9;
               this.MouseZhenfaStr1 = LanResManager.getLanCommonTextWords("三才阵");
               this.MouseZhenfaStr3 = LanResManager.getLanTextWords(this,"三才阵开启条件");
               this.MouseZhenfaStr4 = LanResManager.getLanTextWords(this,"三才阵阵法效果");
               break;
            case LanResManager.getLanCommonTextWords("虎翼阵"):
               _loc4_ = StaticValue.getBitmapByClassName("ui.main.team.zhenfa.huyi");
               this.zhenfaSpr.addChild(_loc4_);
               this.zhenfay = 9;
               this.MouseZhenfaStr1 = LanResManager.getLanCommonTextWords("虎翼阵");
               this.MouseZhenfaStr3 = LanResManager.getLanTextWords(this,"虎翼阵开启条件");
               this.MouseZhenfaStr4 = LanResManager.getLanTextWords(this,"虎翼阵阵法效果");
               break;
            case LanResManager.getLanCommonTextWords("太乙阵"):
               _loc4_ = StaticValue.getBitmapByClassName("ui.main.team.zhenfa.taiyi");
               this.zhenfaSpr.addChild(_loc4_);
               this.zhenfay = 9;
               this.MouseZhenfaStr1 = LanResManager.getLanCommonTextWords("太乙阵");
               this.MouseZhenfaStr3 = LanResManager.getLanTextWords(this,"太乙阵开启条件");
               this.MouseZhenfaStr4 = LanResManager.getLanTextWords(this,"太乙阵阵法效果");
               break;
            case LanResManager.getLanCommonTextWords("锋矢阵"):
               _loc4_ = StaticValue.getBitmapByClassName("ui.main.team.zhenfa.fengshi");
               this.zhenfaSpr.addChild(_loc4_);
               this.zhenfay = 9;
               this.MouseZhenfaStr1 = LanResManager.getLanCommonTextWords("锋矢阵");
               this.MouseZhenfaStr3 = LanResManager.getLanTextWords(this,"锋矢阵开启条件");
               this.MouseZhenfaStr4 = LanResManager.getLanTextWords(this,"锋矢阵阵法效果");
               break;
            case LanResManager.getLanCommonTextWords("流云阵"):
               _loc4_ = StaticValue.getBitmapByClassName("ui.main.team.zhenfa.liuyun");
               this.zhenfaSpr.addChild(_loc4_);
               this.zhenfay = 9;
               this.MouseZhenfaStr1 = LanResManager.getLanCommonTextWords("流云阵");
               this.MouseZhenfaStr3 = LanResManager.getLanTextWords(this,"流云阵开启条件");
               this.MouseZhenfaStr4 = LanResManager.getLanTextWords(this,"流云阵阵法效果");
               break;
            case LanResManager.getLanCommonTextWords("天罡北斗阵"):
               _loc4_ = StaticValue.getBitmapByClassName("ui.main.team.zhenfa.tiangang");
               this.zhenfaSpr.addChild(_loc4_);
               this.zhenfay = 9;
               this.MouseZhenfaStr1 = LanResManager.getLanCommonTextWords("天罡北斗阵");
               this.MouseZhenfaStr3 = LanResManager.getLanTextWords(this,"天罡北斗阵开启条件");
               this.MouseZhenfaStr4 = LanResManager.getLanTextWords(this,"天罡北斗阵阵法效果");
               break;
            case LanResManager.getLanCommonTextWords("伏羲八卦阵"):
               _loc4_ = StaticValue.getBitmapByClassName("ui.main.team.zhenfa.bagua");
               this.zhenfaSpr.addChild(_loc4_);
               this.zhenfay = 9;
               this.MouseZhenfaStr1 = LanResManager.getLanCommonTextWords("伏羲八卦阵");
               this.MouseZhenfaStr3 = LanResManager.getLanTextWords(this,"伏羲八卦阵开启条件");
               this.MouseZhenfaStr4 = LanResManager.getLanTextWords(this,"伏羲八卦阵阵法效果");
         }
         this.zhenfaBgSpr.graphics.clear();
         if(this.zhenfaName != LanResManager.getLanCommonTextWords("无阵法"))
         {
            if(this.isSame)
            {
               this.MouseZhenfaStr2 = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【当前生效】") + "<br></font>";
            }
            else
            {
               this.MouseZhenfaStr2 = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("【当前失效】") + "<br></font>";
               this.zhenfaBgSpr.graphics.lineStyle(0,0,0);
               this.zhenfaBgSpr.graphics.beginFill(0,0.7);
               this.zhenfaBgSpr.graphics.drawRect(0,0,172,30);
            }
         }
         this.duiWuId = param3;
         while(this.duiWuSpr.numChildren != 0)
         {
            this.duiWuSpr.removeChildAt(0);
         }
         if(param3 > 0)
         {
            _loc8_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/team" + param3 + ".swf");
            this.duiWuSpr.addChild(_loc8_);
         }
         var _loc6_:int = int(param1.length);
         _loc5_ = 0;
         while(_loc5_ < 6)
         {
            this.container.getChildAt(_loc5_).visible = false;
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc7_ = this.container.getChildAt(_loc5_) as MainUIMember;
            _loc7_.$parent = this._parent;
            _loc7_.y = _loc5_ * 44 + this.zhenfay;
            _loc7_.img.bitmapData = StaticValue.getBitmapByClassName(param1[_loc5_].headRes).bitmapData;
            _loc7_.img.width = _loc7_.img.height = 25;
            _loc7_.playerName.text = param1[_loc5_].playerName;
            _loc7_.playerLevle.text = param1[_loc5_].level;
            _loc7_.redBar.setValue(Math.floor(Number(param1[_loc5_].hp)),Math.floor(Number(param1[_loc5_].hpMax)));
            _loc7_.blueBar.setValue(Math.floor(Number(param1[_loc5_].mp)),Math.floor(Number(param1[_loc5_].mpMax)));
            _loc7_.setup = param1[_loc5_].setup;
            _loc7_.mapName = param1[_loc5_].mapName;
            _loc7_.hp = Number(param1[_loc5_].hp);
            _loc7_.hpMax = Number(param1[_loc5_].hpMax);
            _loc7_.mp = int(param1[_loc5_].mp);
            _loc7_.mpMax = int(param1[_loc5_].mpMax);
            _loc7_.isSame = param1[_loc5_].isSame;
            _loc7_._aloof.visible = !_loc7_.isSame;
            _loc7_.xy = param1[_loc5_].xy;
            _loc7_.id = param1[_loc5_].id;
            if(param1[_loc5_].zhiYe > 0)
            {
               _loc7_.setZhiYe(true,param1[_loc5_].zhiYe);
            }
            else
            {
               _loc7_.setZhiYe(false);
            }
            _loc7_.visible = true;
            if(param1[_loc5_].leader == LanResManager.getLanCommonTextWords("队长"))
            {
               _loc7_.leaderIco.visible = true;
            }
            else
            {
               _loc7_.leaderIco.visible = false;
            }
            _loc5_++;
         }
      }
      
      public function getDuiWuTips() : String
      {
         var _loc1_:String = "";
         if(this.duiWuId == 1)
         {
            _loc1_ = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("红队") + "<font>";
         }
         else if(this.duiWuId == 2)
         {
            _loc1_ = "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("蓝队") + "<font>";
         }
         return _loc1_;
      }
   }
}

