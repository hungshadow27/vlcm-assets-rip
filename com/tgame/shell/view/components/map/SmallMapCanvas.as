package com.tgame.shell.view.components.map
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.shell.view.components.PopMapPanel;
   import com.tgame.shell.view.components.mainui.smallMap.MapCutline;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.engine.utils.SceneUtil;
   import com.zcp.engine.vo.map.MapTile;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.text.TextFormat;
   import flash.utils.Dictionary;
   
   public class SmallMapCanvas extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      public var $parent:DisplayObject;
      
      public var mapName:FTextArea;
      
      private var container:Sprite;
      
      private var map:Bitmap;
      
      private var mapContainer:Sprite;
      
      private var pathContainer:Sprite;
      
      private var pathEnd:Bitmap;
      
      private var char:MapCutline;
      
      private var wuqi:MapCutline;
      
      private var ren:MapCutline;
      
      private var shen:MapCutline;
      
      private var tian:MapCutline;
      
      private var di:MapCutline;
      
      private var xiuqiu:MapCutline;
      
      private var charContainer:Sprite;
      
      private var npcContainer:Sprite;
      
      private var businessNPCContainer:Sprite;
      
      private var taskNPCContainer:Sprite;
      
      private var funcitonNPCContainer:Sprite;
      
      private var portalContainer:Sprite;
      
      private var otherPlayerContainer:Sprite;
      
      private var teamMemberContainer:Sprite;
      
      private var monsterContainer:Sprite;
      
      private var xiuqiuContainer:Sprite;
      
      private var xLabel:FTextInput;
      
      private var yLabel:FTextInput;
      
      private var portalBtn:SmallButton;
      
      private var npcList:FList;
      
      private var scrollBar:FVScorllBar;
      
      private var autoFindBtn:SmallButton;
      
      private var checkBoxContainer:Sprite;
      
      private var checkBox1:FCheckBox;
      
      private var checkBox2:FCheckBox;
      
      private var checkBox3:FCheckBox;
      
      private var checkBox4:FCheckBox;
      
      private var checkBox5:FCheckBox;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FLabel;
      
      private var _mask:Sprite;
      
      private var bangQiObj:Object;
      
      private var bangQiContainer:Sprite;
      
      private var BiaocheContainer:Sprite;
      
      private var fc1:FCanvas;
      
      private var fc2:FCanvas;
      
      private var fc3:FCanvas;
      
      private var fc4:FCanvas;
      
      private var fc5:FCanvas;
      
      private var bg1:F9GridBitmap;
      
      private var bg2:F9GridBitmap;
      
      public var dynamicScaleX:Number = 10;
      
      public var dynamicScaleY:Number = 10;
      
      public var dynamicDrawSizeX:Number;
      
      public var dynamicDrawSizeY:Number;
      
      private const DRAW_PATH_STEP_SIZE:Number = 2.5;
      
      private var x400:Number = 1;
      
      private var y400:Number = 1;
      
      private var qi3v3Dict:Dictionary;
      
      public function SmallMapCanvas()
      {
         var bg:Bitmap;
         this.bangQiObj = {};
         this.dynamicDrawSizeX = this.DRAW_PATH_STEP_SIZE;
         this.dynamicDrawSizeY = this.DRAW_PATH_STEP_SIZE;
         this.qi3v3Dict = new Dictionary();
         super();
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 0;
         this.fc1.width = 411;
         this.fc1.height = 409;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc3 = new FCanvas();
         this.fc3.x = 410;
         this.fc3.y = 0;
         this.fc3.width = 164;
         this.fc3.height = 29;
         this.fc3.skin = "box_transparence";
         addChild(this.fc3);
         this.fc2 = new FCanvas();
         this.fc2.x = 410;
         this.fc2.y = 28;
         this.fc2.width = 164;
         this.fc2.height = 261;
         this.fc2.skin = "box";
         addChild(this.fc2);
         this.fc4 = new FCanvas();
         this.fc4.x = 410;
         this.fc4.y = 288;
         this.fc4.width = 164;
         this.fc4.height = 28;
         this.fc4.skin = "box";
         addChild(this.fc4);
         this.fc5 = new FCanvas();
         this.fc5.x = 410;
         this.fc5.y = 333;
         this.fc5.width = 164;
         this.fc5.height = 76;
         this.fc5.skin = "box";
         addChild(this.fc5);
         this.bg1 = Tools.get9GridBitmpByName("inputBg");
         this.bg1.width = 35;
         this.bg1.height = 20;
         this.bg1.x = 432;
         this.bg1.y = 6;
         addChild(this.bg1);
         this.bg2 = Tools.get9GridBitmpByName("inputBg");
         this.bg2.width = 35;
         this.bg2.height = 20;
         this.bg2.x = 492;
         this.bg2.y = 6;
         addChild(this.bg2);
         bg = StaticValue.getBitmapByClassName("ui.map.smallmap.txt");
         addChild(bg);
         bg.x = 442;
         bg.y = 317;
         this.init();
         this._mask = new Sprite();
         with(this._mask.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,401,401);
            endFill();
         }
         addChild(this._mask);
         this._mask.x = 3;
         this._mask.y = 3;
         this.container.mask = this._mask;
      }
      
      public static function scaleBitmapData(param1:BitmapData, param2:Number, param3:Number) : BitmapData
      {
         var _loc4_:Matrix = new Matrix();
         _loc4_.scale(param2,param3);
         var _loc5_:BitmapData = new BitmapData(param2 * param1.width,param3 * param1.height,true,0);
         _loc5_.draw(param1,_loc4_);
         return _loc5_;
      }
      
      private function init() : void
      {
         var tf:TextFormat;
         var lb:FLabel = new FLabel();
         with(lb)
         {
            x = 417;
            y = 8;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            text = "X:        Y:";
         }
         addChild(lb);
         tf = new TextFormat();
         tf.align = "center";
         this.xLabel = new FTextInput();
         with(this.xLabel)
         {
            defaultTextFormat = tf;
            x = 436;
            y = 8;
            restrict = "0-9";
            width = 26;
            height = 20;
            textColor = StaticValue.WHITE;
         }
         addChild(this.xLabel);
         this.yLabel = new FTextInput();
         with(this.yLabel)
         {
            defaultTextFormat = tf;
            x = 497;
            y = 8;
            restrict = "0-9";
            width = 26;
            height = 20;
            textColor = StaticValue.WHITE;
         }
         addChild(this.yLabel);
         this.portalBtn = new SmallButton();
         this.portalBtn.label = LanResManager.getLanTextWords(this,"前往");
         addChild(this.portalBtn);
         this.portalBtn.x = 532;
         this.portalBtn.y = 6;
         this.portalBtn.addEventListener(MouseEvent.CLICK,this.onPortal);
         this.npcList = new FList();
         this.npcList.skin = "list";
         this.npcList.itemRenderer = new NpcListRender();
         this.npcList.listWidth = 143;
         this.npcList.listHeight = 257;
         addChild(this.npcList);
         this.npcList.x = 412;
         this.npcList.y = 29;
         this.scrollBar = new FVScorllBar(this.npcList,257);
         addChild(this.scrollBar);
         this.scrollBar.x = 574 - this.scrollBar.width;
         this.scrollBar.y = 29;
         this.mapName = new FTextArea();
         with(this.mapName)
         {
            filters = StaticValue.filter;
            width = 250;
            height = 18;
            x = 230;
            y = -18;
            textColor = 16777215;
         }
         addChild(this.mapName);
         this.container = new Sprite();
         addChild(this.container);
         this.container.x = 3;
         this.container.y = 3;
         this.mapContainer = new Sprite();
         this.container.addChild(this.mapContainer);
         this.mapContainer.addEventListener(MouseEvent.MOUSE_OVER,this.onMap);
         this.mapContainer.addEventListener(MouseEvent.MOUSE_OUT,this.onMap);
         this.mapContainer.addEventListener(MouseEvent.CLICK,this.findPath);
         this.map = new Bitmap();
         this.mapContainer.addChild(this.map);
         this.portalContainer = new Sprite();
         this.container.addChild(this.portalContainer);
         this.npcContainer = new Sprite();
         this.container.addChild(this.npcContainer);
         this.businessNPCContainer = new Sprite();
         this.container.addChild(this.businessNPCContainer);
         this.taskNPCContainer = new Sprite();
         this.container.addChild(this.taskNPCContainer);
         this.funcitonNPCContainer = new Sprite();
         this.container.addChild(this.funcitonNPCContainer);
         this.monsterContainer = new Sprite();
         this.container.addChild(this.monsterContainer);
         this.otherPlayerContainer = new Sprite();
         this.container.addChild(this.otherPlayerContainer);
         this.teamMemberContainer = new Sprite();
         this.container.addChild(this.teamMemberContainer);
         this.charContainer = new Sprite();
         this.container.addChild(this.charContainer);
         this.char = new MapCutline(2);
         this.charContainer.addChild(this.char);
         this.BiaocheContainer = new Sprite();
         this.container.addChild(this.BiaocheContainer);
         this.wuqi = new MapCutline(11,{"name":LanResManager.getLanCommonTextWords("游龙之刃")});
         this.wuqi.visible = false;
         this.charContainer.addChild(this.wuqi);
         this.ren = new MapCutline(12,{"name":LanResManager.getLanCommonTextWords("轩辕人剑")});
         this.shen = new MapCutline(13,{"name":LanResManager.getLanCommonTextWords("轩辕神剑")});
         this.tian = new MapCutline(14,{"name":LanResManager.getLanCommonTextWords("轩辕天剑")});
         this.di = new MapCutline(15,{"name":LanResManager.getLanCommonTextWords("轩辕地剑")});
         this.xiuqiuContainer = new Sprite();
         this.container.addChild(this.xiuqiuContainer);
         this.xiuqiu = new MapCutline(20,{"name":LanResManager.getLanCommonTextWords("绣球")});
         this.xiuqiu.visible = false;
         this.xiuqiuContainer.addChild(this.xiuqiu);
         this.pathContainer = new Sprite();
         this.container.addChild(this.pathContainer);
         this.bangQiContainer = new Sprite();
         this.container.addChild(this.bangQiContainer);
         this.pathEnd = StaticValue.getBitmapByClassName("ui.findpath.end.ico");
         this.pathContainer.addChild(this.pathEnd);
         this.pathEnd.visible = false;
         this.autoFindBtn = new SmallButton();
         this.autoFindBtn.label = LanResManager.getLanTextWords(this,"自动寻至此处");
         addChild(this.autoFindBtn);
         this.autoFindBtn.x = 442;
         this.autoFindBtn.y = 292;
         this.autoFindBtn.addEventListener(MouseEvent.CLICK,this.onAutoFindPath);
         this.checkBoxContainer = new Sprite();
         addChild(this.checkBoxContainer);
         this.checkBoxContainer.x = 412;
         this.checkBoxContainer.y = 335;
         this.checkBox1 = new FCheckBox();
         this.checkBox1.text = LanResManager.getLanTextWords(this,"功能NPC");
         this.checkBox1.textColor = StaticValue.WHITE;
         this.checkBox1.border = true;
         this.checkBox1.selectState = true;
         this.checkBoxContainer.addChild(this.checkBox1);
         this.checkBox1.x = 0;
         this.checkBox1.y = 0;
         this.checkBox1.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.checkBox2 = new FCheckBox();
         this.checkBox2.text = LanResManager.getLanTextWords(this,"任务NPC");
         this.checkBox2.textColor = StaticValue.WHITE;
         this.checkBox2.border = true;
         this.checkBox2.selectState = true;
         this.checkBoxContainer.addChild(this.checkBox2);
         this.checkBox2.x = 80;
         this.checkBox2.y = 0;
         this.checkBox2.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.checkBox3 = new FCheckBox();
         this.checkBox3.text = LanResManager.getLanTextWords(this,"商业NPC");
         this.checkBox3.textColor = StaticValue.WHITE;
         this.checkBox3.border = true;
         this.checkBox3.selectState = true;
         this.checkBoxContainer.addChild(this.checkBox3);
         this.checkBox3.x = 0;
         this.checkBox3.y = 25;
         this.checkBox3.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.checkBox4 = new FCheckBox();
         this.checkBox4.text = LanResManager.getLanTextWords(this,"刷怪点");
         this.checkBox4.textColor = StaticValue.WHITE;
         this.checkBox4.border = true;
         this.checkBox4.selectState = true;
         this.checkBoxContainer.addChild(this.checkBox4);
         this.checkBox4.x = 80;
         this.checkBox4.y = 25;
         this.checkBox4.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.checkBox5 = new FCheckBox();
         this.checkBox5.text = LanResManager.getLanTextWords(this,"传送点");
         this.checkBox5.textColor = StaticValue.WHITE;
         this.checkBox5.border = true;
         this.checkBox5.selectState = true;
         this.checkBoxContainer.addChild(this.checkBox5);
         this.checkBox5.x = 0;
         this.checkBox5.y = 50;
         this.checkBox5.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FLabel();
         with(this.tip)
         {
            x = 2;
            y = 2;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
      }
      
      private function onPortal(param1:MouseEvent) : void
      {
         if(this.xLabel.text == "" || this.yLabel.text == "")
         {
            return;
         }
         var _loc2_:MapTile = SceneUtil.getMapTile(parseInt(this.xLabel.text),parseInt(this.yLabel.text));
         if(_loc2_ == null)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"该坐标超出地图范围"),false);
         }
         else if(_loc2_.isSolid)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"无法前往"),false);
         }
         else if(_loc2_.isSolid)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"轻功前往"),false);
         }
         else
         {
            MainCharSeachPathManager.mainCharWalk(GameInstance.scene.mapConfig.mapID + "," + this.xLabel.text + "," + this.yLabel.text + ",0");
         }
      }
      
      private function onMap(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.mapContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onMap);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip();
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.mapContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMap);
         }
      }
      
      private function onAutoFindPath(param1:MouseEvent) : void
      {
         if(this.npcList.selectItem)
         {
            MainCharSeachPathManager.mainCharWalk(this.npcList.selectItem.id.toString());
         }
      }
      
      private function showTip() : void
      {
         this.dynamicScaleX = 1 / GameInstance.scene.mapConfig.widthScale;
         this.dynamicScaleY = 1 / GameInstance.scene.mapConfig.heightScale;
         this.tip.text = int(this.mapContainer.mouseX * this.x400 * this.dynamicScaleX / 25) + "，" + int(this.mapContainer.mouseY * this.y400 * this.dynamicScaleY / 25);
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
      }
      
      private function onCheck(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.checkBox1:
               this.$parent.dispatchEvent(new BaseEvent(PopMapPanel.MENU_NPC_CLICK,"",this.checkBox1.selectState));
               break;
            case this.checkBox2:
               this.$parent.dispatchEvent(new BaseEvent(PopMapPanel.TASK_NPC_CLICK,"",this.checkBox2.selectState));
               break;
            case this.checkBox3:
               this.$parent.dispatchEvent(new BaseEvent(PopMapPanel.BUSINESS_NPC_CLICK,"",this.checkBox3.selectState));
               break;
            case this.checkBox4:
               this.$parent.dispatchEvent(new BaseEvent(PopMapPanel.MONSTER_POINT_CLICK,"",this.checkBox4.selectState));
               break;
            case this.checkBox5:
               this.$parent.dispatchEvent(new BaseEvent(PopMapPanel.GOTO_POINT_CLICK,"",this.checkBox5.selectState));
         }
      }
      
      private function findPath(param1:MouseEvent) : void
      {
         this.dynamicScaleX = 1 / GameInstance.scene.mapConfig.widthScale;
         this.dynamicScaleY = 1 / GameInstance.scene.mapConfig.heightScale;
         MainCharSeachPathManager.mainCharWalk(GameInstance.scene.mapConfig.mapID + "," + Math.round(this.map.mouseX * this.x400 * this.dynamicScaleX / 25) + "," + Math.round(this.map.mouseY * this.y400 * this.dynamicScaleY / 25) + "," + 0);
      }
      
      public function set dataProvider(param1:XML) : void
      {
         this.npcList.dataProvider = param1;
         if(param1.children().length() > 0)
         {
            this.npcList.setSelectItemByIndex(0);
            this.autoFindBtn.enabled = true;
         }
         else
         {
            this.autoFindBtn.enabled = false;
         }
         this.scrollBar.update();
      }
      
      public function setCharXY(param1:Point) : void
      {
         if(Boolean(this.char) && Boolean(param1) && Boolean(GameInstance.scene.mapConfig))
         {
            this.char.x = param1.x * GameInstance.scene.mapConfig.widthScale / this.x400;
            this.char.y = param1.y * GameInstance.scene.mapConfig.heightScale / this.y400;
         }
      }
      
      public function setCharDirection(param1:int) : void
      {
         this.char.rotation = 180 + param1 * 45;
      }
      
      public function setMap(param1:BitmapData) : void
      {
         var mx:int;
         var my:int;
         var value:BitmapData = param1;
         this.map.bitmapData = value;
         mx = this.map.width;
         my = this.map.height;
         this.x400 = 1;
         this.y400 = 1;
         if(mx > 400)
         {
            this.x400 = this.map.width / 400;
            mx = 400;
         }
         if(my > 400)
         {
            this.y400 = this.map.height / 400;
            my = 400;
         }
         this.mapContainer.x = (404 - mx) / 2;
         this.mapContainer.y = (403 - my) / 2;
         with(this._mask.graphics)
         {
            clear();
            beginFill(0,0);
            drawRect(mapContainer.x,mapContainer.y,mx,my);
            endFill();
         }
         this.map.bitmapData = scaleBitmapData(value,1 / this.x400,1 / this.y400);
         this.xiuqiuContainer.x = this.charContainer.x = this.pathContainer.x = this.npcContainer.x = this.funcitonNPCContainer.x = this.taskNPCContainer.x = this.businessNPCContainer.x = this.portalContainer.x = this.otherPlayerContainer.x = this.teamMemberContainer.x = this.monsterContainer.x = this.mapContainer.x;
         this.xiuqiuContainer.y = this.charContainer.y = this.pathContainer.y = this.npcContainer.y = this.funcitonNPCContainer.y = this.taskNPCContainer.y = this.businessNPCContainer.y = this.portalContainer.y = this.otherPlayerContainer.y = this.teamMemberContainer.y = this.monsterContainer.y = this.mapContainer.y;
      }
      
      public function setOtherPlayer(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:MapCutline = null;
         while(this.otherPlayerContainer.numChildren > 0)
         {
            this.otherPlayerContainer.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new MapCutline(3,param1[_loc2_]);
            this.otherPlayerContainer.addChild(_loc4_);
            _loc4_.x = param1[_loc2_].xy.x * GameInstance.scene.mapConfig.widthScale / this.x400;
            _loc4_.y = param1[_loc2_].xy.y * GameInstance.scene.mapConfig.heightScale / this.y400;
            _loc2_++;
         }
      }
      
      public function setTeamMebmer(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:MapCutline = null;
         while(this.teamMemberContainer.numChildren > 0)
         {
            this.teamMemberContainer.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new MapCutline(4,param1[_loc2_]);
            this.teamMemberContainer.addChild(_loc4_);
            _loc4_.x = param1[_loc2_].xy.x * GameInstance.scene.mapConfig.widthScale / this.x400;
            _loc4_.y = param1[_loc2_].xy.y * GameInstance.scene.mapConfig.heightScale / this.y400;
            _loc2_++;
         }
      }
      
      public function setMonster(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:MapCutline = null;
         while(this.monsterContainer.numChildren > 0)
         {
            this.monsterContainer.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new MapCutline(MapCutline.TYPE_REFRSE_MONSTER_POINT,param1[_loc2_],true);
            this.monsterContainer.addChild(_loc4_);
            _loc4_.x = param1[_loc2_].xy.x * GameInstance.scene.mapConfig.widthScale / this.x400;
            _loc4_.y = param1[_loc2_].xy.y * GameInstance.scene.mapConfig.heightScale / this.y400;
            _loc2_++;
         }
      }
      
      public function setNPC(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:MapCutline = null;
         while(this.npcContainer.numChildren > 0)
         {
            this.npcContainer.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new MapCutline(1,param1[_loc2_]);
            this.npcContainer.addChild(_loc4_);
            _loc4_.x = param1[_loc2_].xy.x * GameInstance.scene.mapConfig.widthScale / this.x400;
            _loc4_.y = param1[_loc2_].xy.y * GameInstance.scene.mapConfig.heightScale / this.y400;
            _loc2_++;
         }
      }
      
      public function setBusinessNPC(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:MapCutline = null;
         while(this.businessNPCContainer.numChildren > 0)
         {
            this.businessNPCContainer.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new MapCutline(6,param1[_loc2_]);
            this.businessNPCContainer.addChild(_loc4_);
            _loc4_.x = param1[_loc2_].xy.x * GameInstance.scene.mapConfig.widthScale / this.x400;
            _loc4_.y = param1[_loc2_].xy.y * GameInstance.scene.mapConfig.heightScale / this.y400;
            _loc2_++;
         }
      }
      
      public function setTaskNPC(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:MapCutline = null;
         while(this.taskNPCContainer.numChildren > 0)
         {
            this.taskNPCContainer.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new MapCutline(6,param1[_loc2_]);
            this.taskNPCContainer.addChild(_loc4_);
            _loc4_.x = param1[_loc2_].xy.x * GameInstance.scene.mapConfig.widthScale / this.x400;
            _loc4_.y = param1[_loc2_].xy.y * GameInstance.scene.mapConfig.heightScale / this.y400;
            _loc2_++;
         }
      }
      
      public function setFunctionNPC(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:MapCutline = null;
         while(this.funcitonNPCContainer.numChildren > 0)
         {
            this.funcitonNPCContainer.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new MapCutline(6,param1[_loc2_]);
            this.funcitonNPCContainer.addChild(_loc4_);
            _loc4_.x = param1[_loc2_].xy.x * GameInstance.scene.mapConfig.widthScale / this.x400;
            _loc4_.y = param1[_loc2_].xy.y * GameInstance.scene.mapConfig.heightScale / this.y400;
            _loc2_++;
         }
      }
      
      public function setPortal(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:MapCutline = null;
         while(this.portalContainer.numChildren > 0)
         {
            this.portalContainer.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new MapCutline(0,param1[_loc2_],true);
            this.portalContainer.addChild(_loc4_);
            _loc4_.x = param1[_loc2_].xy.x * GameInstance.scene.mapConfig.widthScale / this.x400;
            _loc4_.y = param1[_loc2_].xy.y * GameInstance.scene.mapConfig.heightScale / this.y400;
            _loc2_++;
         }
      }
      
      public function setTaskState(param1:Array, param2:Array, param3:Array) : void
      {
         var _loc4_:int = 0;
         var _loc6_:MapCutline = null;
         var _loc5_:int = this.taskNPCContainer.numChildren;
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = this.taskNPCContainer.getChildAt(_loc4_) as MapCutline;
            if(param1.indexOf(_loc6_.id) !== -1)
            {
               _loc6_.setType(MapCutline.TYPE_TASK_ABLE);
            }
            else if(param2.indexOf(_loc6_.id) != -1)
            {
               _loc6_.setType(MapCutline.TYPE_TASK_ING);
            }
            else if(param3.indexOf(_loc6_.id) != -1)
            {
               _loc6_.setType(MapCutline.TYPE_TASK_COMPLETE);
            }
            else
            {
               _loc6_.setType();
            }
            _loc4_++;
         }
         _loc5_ = this.funcitonNPCContainer.numChildren;
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = this.funcitonNPCContainer.getChildAt(_loc4_) as MapCutline;
            if(param1.indexOf(_loc6_.id) !== -1)
            {
               _loc6_.setType(MapCutline.TYPE_TASK_ABLE);
            }
            else if(param2.indexOf(_loc6_.id) != -1)
            {
               _loc6_.setType(MapCutline.TYPE_TASK_ING);
            }
            else if(param3.indexOf(_loc6_.id) != -1)
            {
               _loc6_.setType(MapCutline.TYPE_TASK_COMPLETE);
            }
            else
            {
               _loc6_.setType();
            }
            _loc4_++;
         }
         _loc5_ = this.businessNPCContainer.numChildren;
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = this.businessNPCContainer.getChildAt(_loc4_) as MapCutline;
            if(param1.indexOf(_loc6_.id) !== -1)
            {
               _loc6_.setType(MapCutline.TYPE_TASK_ABLE);
            }
            else if(param2.indexOf(_loc6_.id) != -1)
            {
               _loc6_.setType(MapCutline.TYPE_TASK_ING);
            }
            else if(param3.indexOf(_loc6_.id) != -1)
            {
               _loc6_.setType(MapCutline.TYPE_TASK_COMPLETE);
            }
            else
            {
               _loc6_.setType();
            }
            _loc4_++;
         }
      }
      
      public function drawPath(param1:Array) : void
      {
         var len:int;
         var i:int = 0;
         var value:Array = param1;
         this.dynamicDrawSizeX = this.DRAW_PATH_STEP_SIZE * GameInstance.scene.mapConfig.widthScale * 10;
         this.dynamicDrawSizeY = this.DRAW_PATH_STEP_SIZE * GameInstance.scene.mapConfig.heightScale * 10;
         if(value.length == 0)
         {
            this.pathContainer.graphics.clear();
            this.pathEnd.visible = false;
            return;
         }
         len = int(value.length);
         with(this.pathContainer.graphics)
         {
            clear();
            lineStyle(2,StaticValue.YELLOW);
            i = 0;
            while(i < len)
            {
               if((i + 2) % 2 == 0)
               {
                  moveTo(value[i][0] * dynamicDrawSizeX / x400,value[i][1] * dynamicDrawSizeY / y400);
               }
               else
               {
                  lineTo(value[i][0] * dynamicDrawSizeX / x400,value[i][1] * dynamicDrawSizeY / y400);
               }
               ++i;
            }
            endFill();
         }
         this.pathEnd.visible = true;
         this.pathEnd.x = value[len - 1][0] * this.dynamicDrawSizeX / this.x400;
         this.pathEnd.y = value[len - 1][1] * this.dynamicDrawSizeY / this.y400 - 18;
      }
      
      public function addBangQi(param1:Point, param2:int, param3:Array, param4:Boolean) : void
      {
         var _loc8_:int = 0;
         var _loc5_:String = param3[0];
         if(param3.length > 1)
         {
            _loc8_ = 1;
            while(_loc8_ < param3.length)
            {
               _loc5_ += "\n" + param3[_loc8_];
               _loc8_++;
            }
         }
         var _loc6_:int = param4 ? 65280 : 16776960;
         var _loc7_:MapCutline = param4 ? new MapCutline(9,{
            "id":param2,
            "name":"",
            "xy":param1,
            "dec":_loc5_
         },false,_loc6_) : new MapCutline(10,{
            "id":param2,
            "name":"",
            "xy":param1,
            "dec":_loc5_
         },false,_loc6_);
         this.bangQiContainer.addChild(_loc7_);
         _loc7_.x = param1.x * GameInstance.scene.mapConfig.widthScale / this.x400 + this.mapContainer.x;
         _loc7_.y = param1.y * GameInstance.scene.mapConfig.heightScale / this.y400 + this.mapContainer.y;
         this.bangQiObj[param2] = _loc7_;
      }
      
      public function removeBangQi(param1:int) : void
      {
         if(this.bangQiObj[param1])
         {
            this.bangQiContainer.removeChild(this.bangQiObj[param1]);
         }
         delete this.bangQiObj[param1];
      }
      
      public function removeAllBangQi() : void
      {
         while(this.bangQiContainer.numChildren > 0)
         {
            this.bangQiContainer.removeChildAt(0);
         }
         this.bangQiObj = {};
      }
      
      public function setWuQi(param1:Object) : void
      {
         if(!param1)
         {
            this.wuqi.visible = false;
         }
         else
         {
            this.wuqi.visible = true;
            this.wuqi.x = param1.xy.x * GameInstance.scene.mapConfig.widthScale / this.x400;
            this.wuqi.y = param1.xy.y * GameInstance.scene.mapConfig.heightScale / this.y400;
         }
      }
      
      public function setXiuQiu(param1:Object) : void
      {
         if(!param1)
         {
            this.xiuqiu.visible = false;
         }
         else
         {
            this.xiuqiu.visible = true;
            this.xiuqiu.x = param1.xy.x * GameInstance.scene.mapConfig.widthScale / this.x400;
            this.xiuqiu.y = param1.xy.y * GameInstance.scene.mapConfig.heightScale / this.y400;
         }
      }
      
      public function setRenShenTianDi(param1:Array) : void
      {
         var _loc4_:MapCutline = null;
         var _loc2_:Array = [this.ren,this.shen,this.tian,this.di];
         var _loc3_:int = 0;
         while(_loc3_ < 4)
         {
            _loc4_ = _loc2_[_loc3_];
            if(param1[_loc3_] != null)
            {
               _loc4_.x = param1[_loc3_].xy.x * GameInstance.scene.mapConfig.widthScale / this.x400;
               _loc4_.y = param1[_loc3_].xy.y * GameInstance.scene.mapConfig.heightScale / this.y400;
               if(_loc4_.parent != this.charContainer)
               {
                  this.charContainer.addChild(_loc4_);
               }
            }
            else if(_loc4_.parent != null)
            {
               _loc4_.parent.removeChild(_loc4_);
            }
            _loc3_++;
         }
      }
      
      public function setRenShenTianDi3v3(param1:Array) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:MapCutline = null;
         var _loc6_:Object = null;
         var _loc7_:int = 0;
         if(param1 == null || param1.length == 0)
         {
            for(_loc4_ in this.qi3v3Dict)
            {
               _loc5_ = this.qi3v3Dict[_loc4_];
               if(_loc5_.parent != null)
               {
                  _loc5_.parent.removeChild(_loc5_);
               }
               delete this.qi3v3Dict[_loc4_];
            }
            return;
         }
         var _loc2_:int = int(param1.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc6_ = param1[_loc3_];
            _loc7_ = 16;
            if(_loc6_.type == 1)
            {
               _loc7_ = 17;
            }
            else if(_loc6_.type == 2)
            {
               _loc7_ = 18;
            }
            _loc5_ = this.qi3v3Dict[_loc6_.id];
            if(_loc5_ == null)
            {
               _loc5_ = new MapCutline(_loc7_,_loc6_);
               this.qi3v3Dict[_loc6_.id] = _loc5_;
            }
            else
            {
               _loc5_.changeType(_loc7_);
               _loc5_.changeData(_loc6_);
            }
            _loc5_.x = _loc6_.xy.x * GameInstance.scene.mapConfig.widthScale / this.x400;
            _loc5_.y = _loc6_.xy.y * GameInstance.scene.mapConfig.heightScale / this.y400;
            if(_loc5_.parent != this.charContainer)
            {
               this.charContainer.addChild(_loc5_);
            }
            _loc3_++;
         }
      }
      
      public function setBiaoChe(param1:Object = null) : void
      {
         var _loc2_:MapCutline = null;
         while(this.BiaocheContainer.numChildren > 0)
         {
            this.BiaocheContainer.removeChildAt(0);
         }
         if(param1)
         {
            _loc2_ = new MapCutline(19,param1);
            this.BiaocheContainer.addChild(_loc2_);
            _loc2_.x = param1.xy.x * GameInstance.scene.mapConfig.widthScale / this.x400;
            _loc2_.y = param1.xy.y * GameInstance.scene.mapConfig.heightScale / this.y400;
         }
      }
   }
}

