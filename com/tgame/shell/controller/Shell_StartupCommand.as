package com.tgame.shell.controller
{
   import br.com.stimuli.loading.BulkLoader;
   import br.com.stimuli.loading.loadingtypes.BinaryItem;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.manager.FacadeManager;
   import flash.system.Security;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Shell_StartupCommand extends SimpleCommand
   {
      
      public static var _noteBody:Object;
      
      public function Shell_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         _noteBody = param1.getBody();
         this.registerFileTypes();
         this.readParameters();
         FacadeManager.startupFacade(PipeConstants.STARTUP_LOADRES);
      }
      
      private function registerFileTypes() : void
      {
         BulkLoader.registerNewType("tsze","textBytes",BinaryItem);
         BulkLoader.registerNewType("tse","swfBytes",BinaryItem);
      }
      
      private function readParameters() : void
      {
         var policys:String;
         var json:String;
         var arr:Array = null;
         var item:String = null;
         var vArr:Array = null;
         var vStr:String = null;
         var key:String = null;
         var ver:int = 0;
         GameConfig.flashParameters = _noteBody.parameters;
         GameConfig.decode = _noteBody.decode;
         GameConfig.fileBaseFolder = GameConfig.flashParameters["baseDir"] || "";
         GameConfig.program = GameConfig.flashParameters["program"] || "program";
         if(GameConfig.fileBaseFolder.lastIndexOf("/") != GameConfig.fileBaseFolder.length - 1)
         {
            GameConfig.fileBaseFolder += "/";
         }
         policys = GameConfig.flashParameters["policys"] || "";
         if(policys != "")
         {
            arr = policys.split(",");
            if(Boolean(arr) && arr.length > 0)
            {
               for each(item in arr)
               {
                  item = item.replace(/^\s*|\s*$/g,"").split(" ").join("");
                  Security.loadPolicyFile(item);
               }
            }
         }
         Security.allowDomain("*");
         Security.allowInsecureDomain("*");
         GameConfig.yunying_chongzhi = GameConfig.flashParameters["recharge"];
         GameConfig.resServer = GameConfig.flashParameters["resServer"];
         GameConfig.activeServer = GameConfig.flashParameters["activeServer"];
         GameConfig.mailServer = GameConfig.flashParameters["mailServer"];
         GameConfig.loginServerIP = GameConfig.flashParameters["loginServer"];
         GameConfig.loginServerPortArr = String(GameConfig.flashParameters["loginPort"]).split(",").map(function(param1:*, param2:int, param3:Array):int
         {
            return int(Number(param1));
         });
         GameConfig.loginServerPort = GameConfig.loginServerPortArr.shift();
         GameConfig.chatServerIP = GameConfig.flashParameters["chatServer"];
         GameConfig.chatServerPortArr = String(GameConfig.flashParameters["chatPort"]).split(",").map(function(param1:*, param2:int, param3:Array):int
         {
            return int(Number(param1));
         });
         GameConfig.chatServerPort = GameConfig.chatServerPortArr.shift();
         GameConfig.gameNotice = GameConfig.flashParameters["affiche"];
         GameConfig.photoUpServer = GameConfig.flashParameters["photoUpServer"];
         GameConfig.idCardUrl = GameConfig.flashParameters["idCardUrl"];
         GameConfig.photoDownServer = GameConfig.flashParameters["photoDownServer"];
         GameConfig.gotoAdd = LanResManager.getLanCommonTextWords("暂未开通");
         json = GameConfig.flashParameters["resversion"];
         if(json != undefined && json != "")
         {
            vArr = json.split(",");
            for each(vStr in vArr)
            {
               arr = vStr.split(":");
               if(arr.length == 2)
               {
                  key = arr[0];
                  ver = Number(arr[1]);
                  TVersion.addResKeyBaseUrlVersion(key,"",ver);
               }
            }
         }
      }
   }
}

