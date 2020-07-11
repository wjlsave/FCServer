package com.project.wjl.fcserver.util;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.util.CollectionUtils;

public class TreeUtils {
	
	public static <T extends TreeNode> List<T> buildTreeNodes(List<T> listTreeNode, Long parentId) {
		 
        List<T> distinctList = listTreeNode.stream().distinct().collect(Collectors.toList());
 
        List<T> listTreeNode_ = new ArrayList<>();
 
        for (T node : distinctList) {
            if (node.getParentId().equals(parentId)) {
                listTreeNode_.add(node);
            }
        }
 
        recursionMenuTree(listTreeNode, listTreeNode_);
 
        return listTreeNode_;
    }
 
    private static void recursionMenuTree(List<? extends TreeNode> listTreeNode, List<? extends TreeNode> listSubTreeNode) {
        for (TreeNode subNode : listSubTreeNode) {
 
            for (TreeNode node : listTreeNode) {
                if (subNode.getId().equals(node.getParentId())) {
 
                    if (CollectionUtils.isEmpty(subNode.getChildren())) {
                        subNode.setChildren(new ArrayList<>());
                    }
 
                    if (subNode.getChildren().contains(node)) {
                        continue;
                    }
 
                    subNode.getChildren().add(node);
 
                    recursionMenuTree(listTreeNode, subNode.getChildren());
                }
            }
        }
    }

}
