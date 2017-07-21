//
//  AreaTableViewController.swift
//  FansArea
//
//  Created by happts on 17/7/6.
//  Copyright © 2017年 happts. All rights reserved.
//
import UIKit

class AreaTableViewController: UITableViewController {

    var areas = [ Area(name: "莘庄镇然后在多谢一些字来占用位置好多好多行", provicve:" 上海", part: "华东", image:"xining", isVisited: false ),
                  Area(name: "七里河233333333333333333333333333333333333333333333333333333333333", provicve:" 甘肃", part: "西北", image:"qilihe", isVisited: false ),
                  Area(name: "尤溪县这个少一点", provicve:" 福建", part: "东南", image:"youxi", isVisited: false ),
                  Area(name: "城西恰当的方法二恶放到区", provicve:" 青海", part: "西北", image:"chengxi", isVisited: false ),
                  Area(name: "白云区多余的文字会变成...", provicve:" 广东", part: "华南", image:"baiyun", isVisited: false ),
                  Area(name: "上街镇", provicve:" 福建", part: "东南", image:"shangjie", isVisited: false ),
                  Area(name: "武侯区", provicve:" 黑龙江", part: "东北", image:"nangang", isVisited: false),
                  Area(name: "芙蓉区", provicve:" 山西", part: "华北", image:"yaodu", isVisited: false ),
                  Area(name: "滨湖区", provicve:" 四川", part: "西南", image:"wuhou", isVisited: false),
                  Area(name: "暨南大学", provicve:" 广东", part: "华南", image:"jinping", isVisited: false),
                  Area(name: "江南大学", provicve:" 湖南", part: "华中", image:"furong", isVisited: false )]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension 
        
        //返回按钮除掉文字
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //用 MARK:给代码分块,便于读代码
    
    // MARK: - Table view delegate 动作
    
    //自定义右滑菜单
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let actionShare = UITableViewRowAction(style: .normal, title: "分享")
        {
            (_, indexPath) in
            let actionSheet = UIAlertController(title: "分享", message:  nil, preferredStyle: .actionSheet)
            
            let option1 = UIAlertAction(title: "QQ", style: .default, handler: nil)
            let option2 = UIAlertAction(title: "Wechat", style: .default, handler: nil)
            let option3 = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
            
            actionSheet.addAction(option3)
            actionSheet.addAction(option2)
            actionSheet.addAction(option1)
            self.present(actionSheet, animated: true, completion: nil)
            
        }
        actionShare.backgroundColor = UIColor.orange
        
        
        let actionDel = UITableViewRowAction(style: .default, title: "删除")
        {
            (_, indexPath) in
            self.areas.remove(at: indexPath.row)
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)//即时刷新 删除一行

        }
        
        let actionTop = UITableViewRowAction(style: .default, title: "置顶") { (_, _) in
            
        }
        actionTop.backgroundColor = UIColor(red: 245/255, green: 199/255, blue: 221/255, alpha: 1)
        
        return [actionShare,actionDel,actionTop]
    }
    
                                                        //点击动作
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("你点击了",indexPath.section,"组",indexPath.row,"行")
        
        let menu = UIAlertController(title: "Tips", message: "你点了第\(indexPath.row)行", preferredStyle: .actionSheet)
        let option = UIAlertAction(title: "没去过", style: .default){
            (_) in
            let cell = tableView.cellForRow(at: indexPath)as!CustomTableViewCell
            cell.mark.isHidden = true
            self.visited[indexPath.row] = false
        }
        let option2 = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        let option3 = UIAlertAction(title: "我去过", style: .default){
                ( _ ) in
            let cell = tableView.cellForRow(at: indexPath)as!CustomTableViewCell
            cell.mark.isHidden = false
            self.visited[indexPath.row] = true
        } //handler:执行动作
        
        menu.addAction(option)
        menu.addAction(option2)
        /*
        let menu2 = UIAlertController(title: "", message: "", preferredStyle: .alert) //Controller 的两种 style
        menu2.addAction(option3)
         */
        menu.addAction(option3)
        
        self.present(menu,animated: true,completion: nil)   //让菜单显示
        
        tableView.deselectRow(at: indexPath, animated: true)//取消选中
    }
    */
    
    // MARK: - Table view data source 数据处理
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return areas.count
    }

        //载入单元格
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)as!CustomTableViewCell
            //as!强制转换 as? 安全转换
        
        cell.nameLable.text = areas[indexPath.row].name
        cell.provinceLable.text = areas[indexPath.row].provicve
        cell.partLable.text = areas[indexPath.row].part
        cell.thumblmageView.image = UIImage(named: areas[indexPath.row].image)
        cell.mark.image = UIImage(named: areas[indexPath.row].image)
        
        //图片切圆角
        cell.thumblmageView.layer.cornerRadius = cell.thumblmageView.frame.size.height / 2
        cell.thumblmageView.clipsToBounds = true
        
        if areas[indexPath.row].isVisited{
            cell.mark.isHidden = false
        }
        else{
            cell.mark.isHidden = true
        }
        
        return cell
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.areas.remove(at: indexPath.row)
                //测试代码
            print("还剩的区域数目", self.areas.count)
            for area in areas{
                print(area)
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)//即时刷新 删除一行
//            tableView.reloadData()  //重新载入数据
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    @IBAction func close(segue:UIStoryboardSegue){
    	}
    
    // MARK: - Navigation
        //转场
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showAreaDetail"{
            let dest = segue.destination as! DetailTableViewController
            dest.area = areas[tableView.indexPathForSelectedRow!.row]
        }
    }
 

}
